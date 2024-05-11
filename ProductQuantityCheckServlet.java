// ProductQuantityCheckServlet.java

package com.learn.mycart.servlets;

import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;

import javax.json.Json;
import javax.json.JsonObject;  // Import the JsonObject class
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// import statements...

@WebServlet("/checkProductQuantity")
public class ProductQuantityCheckServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {

            int productId = Integer.parseInt(request.getParameter("productId"));

            // Query the database to get product quantity
            ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
            int productQuantity = productDao.getProductQuantity(productId);

            // Send product quantity as JSON response
            JsonObject jsonObject = Json.createObjectBuilder()
                    .add("quantity", productQuantity)
                    .build();

            out.print(jsonObject.toString());
        }
    }

    // Other methods...

}
