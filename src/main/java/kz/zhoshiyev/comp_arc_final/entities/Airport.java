package kz.zhoshiyev.comp_arc_final.entities;
import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name="airports")
public class Airport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Column(name ="code",unique = true, nullable = false)
    private String code;
    private  String city;
    private String country;
    private Double lat;
    private Double lon;
}
