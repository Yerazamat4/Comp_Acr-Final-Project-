package kz.zhoshiyev.comp_arc_final.service;

import kz.zhoshiyev.comp_arc_final.dto.BookingRequest;
import kz.zhoshiyev.comp_arc_final.entities.Airport;
import kz.zhoshiyev.comp_arc_final.entities.Booking;
import kz.zhoshiyev.comp_arc_final.entities.Jet;
import kz.zhoshiyev.comp_arc_final.entities.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import kz.zhoshiyev.comp_arc_final.repository.AirportRepository;
import kz.zhoshiyev.comp_arc_final.repository.BookingRepository;
import kz.zhoshiyev.comp_arc_final.repository.JetRepository;
import kz.zhoshiyev.comp_arc_final.repository.UserRepository;


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

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Jet jet = jetRepository.findById(request.getJetId())
                .orElseThrow(() -> new RuntimeException("Jet not found"));

        Airport fromAirport = airportRepository.findById(request.getFromAirportId())
                .orElseThrow(() -> new RuntimeException("Airport not found"));

        Airport toAirport = airportRepository.findById(request.getToAirportId())
                .orElseThrow(() -> new RuntimeException("Airport not found"));

        jet.setStatus("UNAVAILABLE");
        jetRepository.save(jet);

Booking booking = new Booking();
        booking.setUser(user);
        booking.setJet(jet);
        booking.setDeparture_date(request.getDepartureDate());
        booking.setFromAirport(fromAirport);;
        booking.setToAirport(toAirport);
        booking.setTotal_price(jet.getPricePerHour());
        booking.setStatus("CONFIRMED");

        double totalPrice = FlightCalculator.totalPrice(
                fromAirport.getLat(), fromAirport.getLon(),
                toAirport.getLat(),   toAirport.getLon(),
                jet.getPricePerHour()
        );

        booking.setTotal_price(totalPrice);

        bookingRepository.save(booking);
    }

    public void cancelBooking(Long id) {

        Booking booking = bookingRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Booking not found"));


        Jet jet = booking.getJet();
        jet.setStatus("AVAILABLE");
        jetRepository.save(jet);


        booking.setStatus("CANCELLED");
        bookingRepository.save(booking);
    }
    public List<Booking> getByUser(String email) {
        return bookingRepository.findByUserEmail(email);
    }
}
