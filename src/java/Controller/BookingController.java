package Controller;

import Model.Booking;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String function = request.getParameter("function");
        String uid = request.getParameter("email");
        int bi = Integer.parseInt(request.getParameter("bookingID"));
        String pic = request.getParameter("pic");

        if (function.equals("payment_main")) {

            Booking pr = new Booking();
            Booking p = pr.getBooking(bi);

            request.setAttribute("booking", p);
            request.getRequestDispatcher("payment/payment_user.jsp").forward(request, response);

        } else if (function.equals("payment_credit")) {
            Booking pr = new Booking();
            Booking p = pr.getBooking(bi);

            request.setAttribute("booking", p);
            request.getRequestDispatcher("payment/credit_card.jsp").forward(request, response);

        } else if (function.equals("payment_cash")) {
            Booking pr = new Booking();
            Booking p = pr.getBooking(bi);

            request.setAttribute("booking", p);
            request.getRequestDispatcher("payment/cash.jsp").forward(request, response);
        } else if (function.equals("payment_ewallet")) {
            Booking pr = new Booking();
            Booking p = pr.getBooking(bi);

            User qr = new User();

            //User q = qr.getUser();
            //ViewBalance
            User q = qr.ViewBalance(uid);

            request.setAttribute("booking", p);
            request.setAttribute("user", q);
            request.getRequestDispatcher("payment/ewallet_pay.jsp").forward(request, response);
        } else if (function.equals("payment_transfer")) {
            Booking pr = new Booking();
            Booking p = pr.getBooking(bi);

            request.setAttribute("booking", p);
            request.getRequestDispatcher("payment/transfer.jsp").forward(request, response);
        }
    }
}

//package Controller;
//
//import Model.Booking;
//import Model.User;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
//public class BookingController extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String function = request.getParameter("function");
//        String uid = request.getParameter("userID");
//
//        if (function.equals("payment_main")) {
//
//            Booking pr = new Booking();
//            Booking p = pr.getBooking();
//
//            request.setAttribute("booking", p);
//            request.getRequestDispatcher("payment/payment_user.jsp").forward(request, response);
//
//        } else if (function.equals("payment_credit")) {
//            Booking pr = new Booking();
//            Booking p = pr.getBooking();
//
//            request.setAttribute("booking", p);
//            request.getRequestDispatcher("payment/credit_card.jsp").forward(request, response);
//
//        } else if (function.equals("payment_cash")) {
//            Booking pr = new Booking();
//            Booking p = pr.getBooking();
//
//            request.setAttribute("booking", p);
//            request.getRequestDispatcher("payment/cash.jsp").forward(request, response);
//        } else if (function.equals("payment_ewallet")) {
//            Booking pr = new Booking();
//            Booking p = pr.getBooking();
//
//            User qr = new User();
//
//            //User q = qr.getUser();
//            //ViewBalance
//            User q = qr.ViewBalance(uid);
//
//            request.setAttribute("booking", p);
//            request.setAttribute("user", q);
//            request.getRequestDispatcher("payment/ewallet_pay.jsp").forward(request, response);
//        } else if (function.equals("payment_transfer")) {
//            Booking pr = new Booking();
//            Booking p = pr.getBooking();
//
//            request.setAttribute("booking", p);
//            request.getRequestDispatcher("payment/transfer.jsp").forward(request, response);
//        }
//    }
//}

