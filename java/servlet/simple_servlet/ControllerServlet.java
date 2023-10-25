package servlet.simple_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servlet.simple_servlet.model.ResultsBean;

import java.io.IOException;

/**
 * The controller servlet.
 */
@WebServlet()
public final class ControllerServlet extends HttpServlet {

    private ResultsBean resultsBean;

    @Override
    public void init() throws ServletException {
        super.init();
        this.resultsBean = new ResultsBean();
    }

    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("error", "0");
        if(request.getParameter("r") != null){
            request.setAttribute("resultsBean", resultsBean);
            String path;
            if(Float.parseFloat((String) request.getParameter("x")) < -5 || Float.parseFloat((String) request.getParameter("x")) > 3 ) {
                path = "/resources/form.jsp";
                request.setAttribute("error", "1");
            } else
            if(Float.parseFloat((String) request.getParameter("y")) < -5 || Float.parseFloat((String) request.getParameter("y")) > 3 ) {
                path = "/resources/form.jsp";
                request.setAttribute("error", "1");
            } else
            if(Float.parseFloat((String) request.getParameter("r")) < 2 || Float.parseFloat((String) request.getParameter("r")) > 5 ) {
                path = "/resources/form.jsp";
                request.setAttribute("error", "1");
            } else
            if (request.getParameter("x") == null || request.getParameter("y") == null) {
                path = "/resources/form.jsp";
            } else {
                request.setAttribute("R", request.getParameter("r"));
                request.setAttribute("X", request.getParameter("x"));
                request.setAttribute("Y", request.getParameter("y"));
                path = "/checkArea";
            }
            getServletContext().getRequestDispatcher(path).forward(request, response);
        }
        else {

            request.setAttribute("resultsBean", resultsBean);
            request.getRequestDispatcher("/resources/form.jsp").forward(request, response);
        }
    }
}