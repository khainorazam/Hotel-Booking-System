package Controller;

import Model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String function = request.getParameter("function");
        String email = request.getParameter("email");
        

            if(function.equals("Create Payment"))
            {
            String paymentType = request.getParameter("paymentType");
            String roomType = request.getParameter("roomType");
            float amount = Float.parseFloat(request.getParameter("amount"));
            
            Payment p = new Payment();

                p.setPaymentType(paymentType);
                p.setRoomType(roomType);
                p.setAmount(amount);
                p.setEmail(email);

                p.createPayment(paymentType,roomType,amount,email);    
                request.getRequestDispatcher("payment/thanks.jsp").forward(request,response);
            }
            
            else if(function.equals("Delete"))
            {
                int id = Integer.parseInt(request.getParameter("paymentID"));

                Payment pr = new Payment();

                pr.deletePayment(id);
           
            }    
            
                
                Payment cs = new Payment();

                List<Payment> ls = cs.getAllPayment();

                request.setAttribute("ls",ls);
                request.getRequestDispatcher("payment/payment_list.jsp").forward(request,response);           

    }
}
