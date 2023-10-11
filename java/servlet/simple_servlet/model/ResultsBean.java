package servlet.simple_servlet.model;

import jakarta.ejb.Stateful;
import java.util.ArrayList;

@Stateful
public class ResultsBean {
    private final ArrayList<ResultModel> resultsList = new ArrayList<>();

    public ArrayList<ResultModel> getResultsList() {
        return resultsList;
    }

    public void setResultToList(ResultModel resultModel) {
        this.resultsList.add(resultModel);
    }
}
