package ca.ibs.imenu.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
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
 * Order - this is an entity representing ORDERS table in iMenu database
 * Date 2020-12-04
 *
 * @author Caique
 * @version 0.0.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ORDERS")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private Status status;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private BigDecimal totalPrice;
    private String note;
    private int tableNumber;

    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL)
    private List<OrderItem> items = new ArrayList<>();
    
    /**
	 * addItem - add the item to the order
	 * Date 2020-12-04
	 *
	 * @param item - representing the item that is added to the order
	 */
    public void addItem(OrderItem item) {
        item.setOrder(this);
        items.add(item);
    }

    /**
	 * calcTotal - calculate total amount of the order
	 * Date 2020-12-04
	 */
    public void calcTotal(){
        totalPrice = new BigDecimal(0);
        for (OrderItem item: items){

            item.setTotalPrice(item.getUnitPrice().multiply(new BigDecimal(item.getQuantity())));
            totalPrice = totalPrice.add(item.getTotalPrice());
        }
    }

}
