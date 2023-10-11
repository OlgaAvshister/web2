package servlet.simple_servlet.model;

public class ResultModel {
    private float x;
    private float y;
    private float r;
    private boolean fallsIntoArea;

    public ResultModel(float x, float y, float r, boolean fallsIntoArea) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.fallsIntoArea = fallsIntoArea;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getR() {
        return r;
    }

    public boolean isFallsIntoArea() {
        return fallsIntoArea;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setR(float r) {
        this.r = r;
    }

    public void setFallsIntoArea(boolean fallsIntoArea) {
        this.fallsIntoArea = fallsIntoArea;
    }
}
