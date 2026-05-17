package kz.zhoshiyev.comp_arc_final.entities;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name="jet_id")
    private Jet jet;
    @Column(name = "departure_date")
    private LocalDateTime departure_date;
    private String route;
    private Double total_price;
    private String status;
    @ManyToOne
    @JoinColumn(name = "from_airport_id")
    private Airport fromAirport;
    @ManyToOne
    @JoinColumn(name = "to_airport_id")
    private Airport toAirport;


}
