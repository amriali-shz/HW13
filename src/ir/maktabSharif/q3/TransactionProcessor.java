package ir.maktabSharif.q3;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TransactionProcessor {
    public static Map<String, Double> filterAndSumTransactions(List <Transaction> transactions,
                                                               LocalDate startDate,
                                                               LocalDate endDate,
                                                               double threshold) {
        return transactions.stream()
                .filter(t -> !t.getDate().isBefore(startDate) && !t.getDate().isAfter(endDate))
                .sorted(Comparator.comparing(Transaction::getDate))
                .collect(Collectors.groupingBy(
                        Transaction :: getUserId,
                        Collectors.summingDouble(Transaction::getAmount)
                ))
                .entrySet().stream()
                .filter(entry -> entry.getValue() > threshold)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }
}
