package kz.zhoshiyev.comp_arc_final.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;


@Data
public class BookingRequest {
    private Long jetId;
    private Long fromAirportId;
    private Long toAirportId;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime departureDate;
}
