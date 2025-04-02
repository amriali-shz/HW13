package ir.maktabSharif.q3;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static ir.maktabSharif.q3.TransactionProcessor.filterAndSumTransactions;

public class Main {
    public static void main(String[] args) {
        List<Transaction> transactions = Arrays.asList(
                new Transaction("T1", "User1", 100.0, LocalDate.of(2024,3,15)),
                new Transaction("T2", "User2", 250.0, LocalDate.of(2024,3,18)),
                new Transaction("T3", "User1", 300.0, LocalDate.of(2024,3,20)),
                new Transaction("T4", "User3", 50.0, LocalDate.of(2024,3,22)),
                new Transaction("T5", "User2", 400.0, LocalDate.of(2024,3,25))
        );

        LocalDate startDate = LocalDate.of(2024,3,10);
        LocalDate endDate = LocalDate.of(2024,3,30);
        double threshold = 200.0;

        Map<String, Double> result = filterAndSumTransactions (transactions,startDate,endDate,threshold);

        if (result.isEmpty()) {
            System.out.println("No transactions found");
        }
        else {
            System.out.println("Filtered transactions: " + result);

        }
    }
}
