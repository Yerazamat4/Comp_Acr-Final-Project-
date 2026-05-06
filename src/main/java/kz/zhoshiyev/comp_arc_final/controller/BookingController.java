package kz.zhoshiyev.comp_arc_final.controller;

import org.springframework.ui.Model;
import kz.zhoshiyev.comp_arc_final.dto.BookingRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import kz.zhoshiyev.comp_arc_final.repository.AirportRepository;
import kz.zhoshiyev.comp_arc_final.service.BookingService;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BookingController {

    private final BookingService bookingService;
    private final AirportRepository airportRepository;

    @GetMapping("/bookings/new")
    public String bookingForm(@RequestParam Long jetId, Model model) {
        model.addAttribute("jetId", jetId);
        model.addAttribute("airports", airportRepository.findAll());
        return "booking-form";
    }

    @PostMapping("/bookings")
    public String createBooking(@ModelAttribute BookingRequest request,
                                Principal principal) {
        bookingService.createBooking(request, principal.getName());
        return "redirect:/bookings/my";
    }

    @PostMapping("/bookings/{id}/cancel")
    public String cancelBooking(@PathVariable Long id) {
        bookingService.cancelBooking(id);
        return "redirect:/bookings/my";
    }

    @GetMapping("/bookings/my")
    public String myBookings(Model model, Principal principal) {
        model.addAttribute("bookings", bookingService.getByUser(principal.getName()));
        return "my-bookings";
    }
}