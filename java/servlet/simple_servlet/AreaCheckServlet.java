package servlet.simple_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servlet.simple_servlet.model.ResultModel;
import servlet.simple_servlet.model.ResultsBean;

import java.io.IOException;

/**
 * The type Spec room servlet.
 */
@WebServlet()
public final class AreaCheckServlet extends HttpServlet {

    public AreaCheckServlet() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response)
            throws IOException, ServletException {

        float r = Float.parseFloat((String) request.getAttribute("R"));
        float x = Float.parseFloat((String) request.getAttribute("X"));
        float y = Float.parseFloat((String) request.getAttribute("Y"));

        boolean fallsIntoArea = fallsIntoArea(x, y, r);

        ResultModel resultModel = new ResultModel(x, y, r, fallsIntoArea);
        ResultsBean resultsBean = (ResultsBean) request.getAttribute("resultsBean");
        resultsBean.setResultToList(resultModel);
        request.setAttribute("resultModel", resultModel);

        getServletContext().getRequestDispatcher("/resources/result.jsp").forward(request, response);
    }

    private boolean fallsIntoArea(float x, float y, float r) {
        boolean fitsIntoFirst = y >= 0 && x >= 0 && y <= r/2 - x;
        boolean fitsIntoSecond = x <= 0 && y >= 0 && x >= -r/2 && y <= r;
        boolean fitsIntoFourth = y <= 0 && x <= 0 && Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)) <= r;

        return fitsIntoFirst || fitsIntoSecond || fitsIntoFourth;
    }
}