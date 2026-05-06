package kz.zhoshiyev.comp_arc_final.entities;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name="Jets")
public class Jet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String model;
    private Long capacity;
    private Double price_per_hour;
    private String status;
    private String photo_url;

    public BigDecimal getPricePerHour() {
        return null;
    }
}