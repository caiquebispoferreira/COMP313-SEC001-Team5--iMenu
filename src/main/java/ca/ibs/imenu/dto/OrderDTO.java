package ca.ibs.imenu.dto;

import ca.ibs.imenu.entity.Order;
import ca.ibs.imenu.entity.OrderItem;
import ca.ibs.imenu.entity.Status;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * OrderDTO - this is DTO representing ORDERS table in iMenu database
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO implements Serializable {
    private Long id;
    @Enumerated(EnumType.STRING)
    private Status status;
    @JsonFormat(pattern = "MM/dd/yyyy")
    private LocalDate date;
    private BigDecimal totalPrice;
    private String note;
    private int tableNumber;
    private List<OrderItemDTO> items = new ArrayList<>();

    public OrderDTO(Order order){
        this. id = order.getId();
        this.status = order.getStatus();
        this.date = order.getDate();
        this.totalPrice = order.getTotalPrice();
        this.note = order.getNote();
        this.tableNumber = order.getTableNumber();
        for (OrderItem item : order.getItems())
            addItem(new OrderItemDTO(item));
    }

    public void addItem(OrderItemDTO item) {
        items.add(item);
    }

}
