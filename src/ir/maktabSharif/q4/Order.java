package ir.maktabSharif.q4;

import java.time.LocalDate;
import java.util.List;

class Order {
    private String orderId;
    private String customerId;
    private LocalDate orderDate;
    private List<Item> items;

    public Order(String orderId, String customerId, LocalDate orderDate, List<Item> items) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.items = items;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public List<Item> getItems() {
        return items;
    }
}
