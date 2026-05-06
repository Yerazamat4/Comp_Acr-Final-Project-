package entities;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {
    private Long id;
    private String name;
    private String email;
    private String password;
    private Long phone_num;

}
