package com.lcdzzz.managebooks.controller;

import com.lcdzzz.managebooks.service.BookService;
import com.lcdzzz.managebooks.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/managebooks")
public class ReaderController {
    @Autowired //可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 通过 @Autowired的使用来消除 set ，get方法
    BookService bookService;


    //当点击detail_user.html中的预约图书时，执行了这里的方法
    @GetMapping(value = "/booklist")
    public String listBookList(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user"); //LoginController中的detail方法已经把对象放到user里面去了
        model.addAttribute("user", user);//把user对象放到model容器中
        List<BookList> list = bookService.getlist();//执行select语句得到booklist表中所有内容并存入list集合中
        model.addAttribute("list", list);//把list集合放入model容器中
        return "user_booklist";//跳转到预约图书界面
    }

    //这是查询功能的controller层
    @PostMapping(value = "/query")
    public String listBookListById(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");//拿到user对象
        model.addAttribute("user", user);//把user对象封装到容器中
        String bname = request.getParameter("bname");//通过request请求得到bname的
        // 值，在user_booklist.html，form表单的提交方式是post，与这里的postmapping相符，bname是input中name的值
        List<BookList> list = bookService.getlistByQuery(bname);//bname作为参数被参与了getlistByQuery方法，
        // 进行了模糊查询，从booklist表中得到的值被放进了list集合中
        model.addAttribute("list", list);//把list集合封装到model容器中，方便$(XXX.xxx)得到值
        return "user_booklist";
    }

    //点击user_booklist.html的预约按钮，跳转到这里。同时，这里的ISBN是在user_booklist.html通过上一个model里的list得到的(booklist.isbn)

    @GetMapping(value = "/{ISBN}/booklist")
    public String listBookListById(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "ISBN") String ISBN,//接收请求路径中占位符(ISBN)的值
            HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");//在session中得到user对象
        model.addAttribute("user", user);
        response.setContentType("text/html;charset=utf8");//设置响应的编码方式
        ReservationResult<Reservation> rr;//这是一个实体类，里面存储了是否成功，数据，错误信息
        PrintWriter pw = null;//后面需要pw来打印内容到网页上
        Reservation r = null;
        try {
            pw = response.getWriter();//会有一个io异常
            bookService.processRes(ISBN, user);//通过xml中的储存过程想reservation表中添加数据
            rr = new ReservationResult<>(true, "预约成功");
        } catch (Exception e) {
            rr = new ReservationResult<>(true, "预约失败");
        }
        if (rr.isSuccess()) {
            pw.print("<script>alert('预约成功');window.location.href='/managebooks/booklist';</script>");
        } else {
            pw.print("<script>alert('预约失败,请重新预约!');window.location.href='/managebooks/booklist';</script>");
        }
        //以上的功能没有完全实现，在xml里面的存储结构逻辑有点复杂，我看了很久没有看懂，准备先不管，等寒假有时间再好好读
        List<BookList> list = bookService.getlist();//获取booklist表中的数据
        model.addAttribute("list", list);
        return "user_booklist";
    }


    //点击detail_user.html中的查看预约情况，便可以跳转到这里
    @GetMapping(value = "/reservation")
    public String listResListById(Model model,
                                  HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");//获取对象
        model.addAttribute("user", user);//把user对象放进model容器，在user_booklist.html中的"/detail_user::homepage"，
        // 即在detail_user.html的片段：homepage中需要使用
        List<ReservationDetail> list = bookService.getResById(user);//在reservation_detail这个视图中
        // 查询得到和user对象的userId属性相匹配的数据并放进list这个集合中
        model.addAttribute("list", list);//把list集合封装到model容器中，供user_reservation.html使用
        return "user_reservation";
    }


    //点击detail_user.html中的退还图书就会跳转到这里
    @GetMapping(value = "/borrow")
    public String listBorListById(Model model,
                                  HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BorrowDetail> list = bookService.getBorInfo(user);//把（查询到）borrow_detail视图中符合条件的数据
        // ，放进list集合中
        model.addAttribute("list", list);
        return "user_borrow";
    }


    //在user_borrow.html中点击还书，就会跳转到这里
    @GetMapping(value = "{borrowId}/return")
    public String returnBookById(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "borrowId") Integer borrowId) {//接收请求路径中占位符(borrowId)的值
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        //以上两条代码重复很多次了，就不解释了
        bookService.returnBookById(borrowId);//更新borrow表中的数据，给对应的rtime属性（归还时间）附上值
        List<BorrowDetail> list = bookService.getBorInfo(user);//把（查询到）borrow_detail视图中符合条件的数据
        model.addAttribute("list", list);//封装，以后使用
        return "user_borrow";
    }

    // admin
    //点击detail_admin.html页面中的添加图书，就会跳转到这里
    @GetMapping(value = "/admin/books")
    public String showBook(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BookList> list = bookService.getlist();//查询booklist表中的所有数据
        model.addAttribute("list", list);//封装到model容器中以便于admin_addbook.html得到所有的图书信息
        return "admin_addbook";
    }

    // 添加图书
    @RequestMapping(value = "/admin/books",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"}) //设置返回数据的类型以及编码，是json
    @ResponseBody //java对象转为json格式的数据
    public ProcessResult addbook(HttpServletRequest request,
                                 @RequestBody BookList bookList) {//接收前端传递给后端的json字符串中的数据,
        // 这里也就是booklist这个对象
        User user = (User) request.getSession().getAttribute("user");
        ProcessResult ar;
        bookList.setOperator(user.getUserId());
        bookService.addBookList(bookList,0);//state为0表示没有被借
        ar = new ProcessResult(true);//添加图书结果的实体类，status表示成功
        return ar;
    }


    //点击detail_admin.管理预约，就会跳转到这里
    @GetMapping(value = "/admin/reservation")
    public String processRes(
            Model model,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");//通过request请求得到放在session当中的对象
        model.addAttribute("user", user);
        List<ReservationDetail> list = bookService.getResList();//得到（查询）reservation_detail视图中的数据并放到list集合中
        model.addAttribute("list", list);
        return "admin_processreservation";
    }

    //点击admin_processreservation.html中的同意申请就会跳转到这里
    @GetMapping(
            value = "/admin/{reservationId}/borrow")
    public String addBorrow(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "reservationId") Integer reservationId) {//接收请求路径中占位符(reservationId)的值
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        bookService.insertBorrow(reservationId,user.getUserId());//通过定义的borrow_from_res存储过程，来（增，插入）同意申请，
        // 并且把截止时间默认成60天以后
        List<ReservationDetail> list = bookService.getResList();//在reservation_detail视图中得到数据并放到list集合中
        model.addAttribute("list", list);
        return "admin_processreservation";
    }

    // 点击detail_admin.html中的查看借阅情况，就会跳转到这里
    @GetMapping(
            value = "/admin/borrow")
    public String showBorrow(
            Model model,
            HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        List<BorrowDetail> list = bookService.getBorList();//查询borrow_detail视图中的数据并放进list集合中
        model.addAttribute("list", list);
        return "admin_borrow";
    }


   /* @RequestMapping(
            value = "/admin/delete")
    @ResponseBody
    public ProcessResult delBookList(
            HttpServletRequest request,
            @RequestBody BookList bookList) {//java对象转为json格式的数据
            User user = (User) request.getSession().getAttribute("user");
            ProcessResult pr;
            bookService.deleteBookList(bookList);
            pr=new ProcessResult(true);

        return pr;
    }*/
   @GetMapping(value = "/{ISBN}/delete")
    public String delBooklist(
            Model model,
            HttpServletRequest request,
            @PathVariable(value = "ISBN")String ISBN,//接受请求路径中占位符（ISBN）的值
            HttpServletResponse response){
       User user = (User) request.getSession().getAttribute("user");
       model.addAttribute("user",user);
       bookService.deleteBookList(ISBN);//在booklist表中删除ISBN和传入的ISBN相等的数据
       List<BookList> list = bookService.getlist();//查询booklist表中的所有数据
       model.addAttribute("list", list);//封装到model容器中以便于admin_addbook.html得到所有的图书信息
       return "admin_addbook";
   }
}
