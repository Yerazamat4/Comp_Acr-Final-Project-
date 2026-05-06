package entities;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString

public class Airport {
    private Long id;
    private String name;
    private String code_IATA;
    private  String city;
    private String country;
}
