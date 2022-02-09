package Controller;

import Model.User;
import Model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String function = request.getParameter("function");
        String email = request.getParameter("email");

        if (function.equals("Pay by ewallet")) {
            String paymentType = request.getParameter("paymentType");
            String roomType = request.getParameter("roomType");
            float amount = Float.parseFloat(request.getParameter("amount"));
            float ebalance = Float.parseFloat(request.getParameter("ebal"));

            User q = new User();
            Payment p = new Payment();

            p.setPaymentType(paymentType);
            p.setRoomType(roomType);
            p.setAmount(amount);
            p.setEmail(email);

            p.createPayment(paymentType, roomType, amount, email);

            q.updateEbalance(email, ebalance);

            request.getRequestDispatcher("payment/thanks.jsp").forward(request, response);
        } else if (function.equals("Topup_ewallet")) {
            float ebalance = Float.parseFloat(request.getParameter("ebal"));
            float amount = Float.parseFloat(request.getParameter("amount"));
            float new_bal = ebalance + amount;
            User q = new User();

            q.updateEbalance(email, new_bal);
            request.getRequestDispatcher("payment/thanks.jsp").forward(request, response);

        } else if (function.equals("ViewBalance") || function.equals("EwalletHome")) {

            User qr = new User();

            User q = qr.ViewBalance(email);

            request.setAttribute("user", q);
            if (function.equals("ViewBalance")) {
                request.getRequestDispatcher("payment/ewallet_home.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("payment/ewallet_topup.jsp").forward(request, response);
            }
        }

        Payment cs = new Payment();

        List<Payment> ls = cs.getAllPayment();

        request.setAttribute("ls", ls);
        request.getRequestDispatcher("payment/payment_list.jsp").forward(request, response);

    }
}
