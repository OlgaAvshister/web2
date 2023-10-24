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
        if(request.getParameter("r") != null){
            request.setAttribute("resultsBean", resultsBean);
            String path;

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