package entities;

import java.util.Date;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Booking {
    private Long id;
    private Long user_id;
    private Long jet_id;
    private Date departure_date;
    private String route;
    private Double total_price;
    private String status;
}
