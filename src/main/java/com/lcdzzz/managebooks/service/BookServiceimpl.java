package com.lcdzzz.managebooks.service;

import com.lcdzzz.managebooks.dao.BookMapper;
import com.lcdzzz.managebooks.enumeration.ExceptionEnum;
import com.lcdzzz.managebooks.exception.ServiceException;
import com.lcdzzz.managebooks.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceimpl implements BookService {
    @Autowired(required = false)
    BookMapper bookMapper;

    // user
    @Override
    public List<BookList> getlist() {
        return bookMapper.getList();
    }

    @Override
    public List<BookList> getlistByQuery(String query) {
        return bookMapper.getListByQuery(query);
    }

    @Override
    public List<Book> getlistByuId(int userId) {
        return null;
    }

    @Override
    public void processRes(String ISBN, User user) {
        int count = bookMapper.processRes(ISBN, user);
        if (count == 0) throw new ServiceException(ExceptionEnum.RESERVATION_FAILURE);
    }

    @Override
    public void addBookList(BookList bookList,int state) {
        bookMapper.addBookList(bookList,"图书流通室",state);
    }

    @Override
    public void insertBorrow(int reservationId,int operator) {
        bookMapper.insertBorrow(reservationId,operator);
    }

    @Override
    public List<ReservationDetail> getResById(User user) {
        return bookMapper.getResById(user);
    }

    @Override
    public int deleteBookList(String IBSN) {
        return bookMapper.deleteBookListById(IBSN);
    }

    @Override
    public List<Reservation> getResInfo() {
        return null;
    }

    @Override
    public List<BorrowDetail> getBorInfo(User user) {
        return bookMapper.getBorById(user);
    }

    @Override
    public List<ReservationDetail> getResList() {
        return bookMapper.getResList();
    }

    @Override
    public void returnBookById(int borrowId) {
        bookMapper.returnBookById(borrowId);
    }

    @Override
    public List<BorrowDetail> getBorList() {
        return bookMapper.getBorList();
    }

}
