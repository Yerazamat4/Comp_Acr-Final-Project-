package kz.zhoshiyev.comp_arc_final.service;

import kz.zhoshiyev.comp_arc_final.dto.BookingRequest;
import kz.zhoshiyev.comp_arc_final.entities.Booking;
import kz.zhoshiyev.comp_arc_final.entities.Jet;
import kz.zhoshiyev.comp_arc_final.entities.User;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Service;
import kz.zhoshiyev.comp_arc_final.repository.AirportRepository;
import kz.zhoshiyev.comp_arc_final.repository.BookingRepository;
import kz.zhoshiyev.comp_arc_final.repository.JetRepository;
import kz.zhoshiyev.comp_arc_final.repository.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookingService {

    private final BookingRepository bookingRepository;
    private final JetRepository jetRepository;
    private final UserRepository userRepository;
    private final AirportRepository airportRepository;

    public void createBooking(BookingRequest request, String email) {

        // находим пользователя по email
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // находим джет
        Jet jet = jetRepository.findById(request.getJetId())
                .orElseThrow(() -> new RuntimeException("Jet not found"));

        // меняем статус джета
        jet.setStatus("UNAVAILABLE");
        jetRepository.save(jet);

Booking booking = new Booking();
        booking.setUser(user);
        booking.setJet(jet);
        booking.setDeparture_date(LocalDateTime.from(LocalDate.from(request.getDepartureDate())));
        booking.setFromAirport(request.getFromAirportId());
        jet.setPrice_per_hour(booking.getTotal_price());
        booking.setStatus("CONFIRMED");

        bookingRepository.save(booking);
    }

    public void cancelBooking(Long id) {

        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        // возвращаем джету статус
        Jet jet = booking.getJet();
        jet.setStatus("AVAILABLE");
        jetRepository.save(jet);

        // отменяем бронь
        booking.setStatus("CANCELLED");
        bookingRepository.save(booking);
    }

    public List<Booking> getByUser(String email) {
        return bookingRepository.findByUserEmail(email); // ← исправь здесь
    }
}
