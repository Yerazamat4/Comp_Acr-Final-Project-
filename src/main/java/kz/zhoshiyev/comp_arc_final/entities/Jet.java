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
    @Column(name = "price_per_hour")
    private Double pricePerHour;
    private String status;
    @Column(name = "photo_url")
    private String photoUrl;


}