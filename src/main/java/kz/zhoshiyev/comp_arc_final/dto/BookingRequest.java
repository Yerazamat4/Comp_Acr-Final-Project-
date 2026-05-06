package kz.zhoshiyev.comp_arc_final.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class BookingRequest {
    private Long jetId;
    private Long fromAirportId;
    private Long toAirportId;
    private LocalDateTime departureDate;
}
