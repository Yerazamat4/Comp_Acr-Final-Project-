package entities;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Jet {
    private Long id;
    private String model;
    private Long capacity;
    private Double price_per_hour;
    private  String status;
    private String photo_url;

}
