package ir.maktabSharif.q4;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class OrderProcessor {
    public static Map<String, Double> filterOrders(List<Order> orders, LocalDate startDate, LocalDate endDate, double threshold) {
        return orders.stream()
                .filter(order -> !order.getOrderDate().isBefore(startDate) && !order.getOrderDate().isAfter(endDate))
                .filter(order -> order.getItems().stream().anyMatch(item -> item.getPrice() > threshold))
                .collect(Collectors.groupingBy(
                        Order::getCustomerId,
                        Collectors.summingDouble(order -> order.getItems().stream().mapToDouble(Item::getPrice).sum())
                ));
    }
}

