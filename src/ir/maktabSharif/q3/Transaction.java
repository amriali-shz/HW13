package ir.maktabSharif.q3;

import java.time.LocalDate;

public class Transaction {
    private String id;
    private String userId;
    private double amount;
    private LocalDate date;

    public Transaction(String id, String userId, double amount, LocalDate date) {
        this.id = id;
        this.userId = userId;
        this.amount = amount;
        this.date = date;
    }

    public String getUserId() {
        return userId;
    }

    public double getAmount() {
        return amount;
    }

    public LocalDate getDate() {
        return date;
    }
}
