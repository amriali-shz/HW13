package ir.maktabSharif.q4;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static ir.maktabSharif.q4.OrderProcessor.filterOrders;

public class Main {
    public static void main(String[] args) {
        List<Item> items1 = Arrays.asList(new Item("Laptop", 1200), new Item("Mouse", 50));
        List<Item> items2 = Arrays.asList(new Item("Phone", 800), new Item("Headphones", 200));
        List<Item> items3 = Arrays.asList(new Item("Keyboard", 100), new Item("Monitor", 300));

        List<Order> orders = Arrays.asList(
                new Order("O1", "C1", LocalDate.of(2024, 3, 10), items1),
                new Order("O2", "C2", LocalDate.of(2024, 3, 15), items2),
                new Order("O3", "C1", LocalDate.of(2024, 3, 20), items3)
        );

        Map<String, Double> result = filterOrders(orders,
                LocalDate.of(2024, 3, 1),
                LocalDate.of(2024, 3, 30), 150);
        System.out.println(result);
    }
}


