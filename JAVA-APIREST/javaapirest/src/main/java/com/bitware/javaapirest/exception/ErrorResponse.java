package com.bitware.javaapirest.exception; // o com.bitware.javaapirest.response según donde lo coloques

public class ErrorResponse {
    private String message;
    private String path;
    private int status;
    private long timestamp;

    public ErrorResponse(String message, String path, int status) {
        this.message = message;
        this.path = path;
        this.status = status;
        this.timestamp = System.currentTimeMillis();
    }

    // Getters y Setters
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public long getTimestamp() {
        return timestamp;
    }
}
