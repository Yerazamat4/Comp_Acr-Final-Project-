package kz.zhoshiyev.comp_arc_final.controller;


import kz.zhoshiyev.comp_arc_final.service.JetService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
public class JetController {

    private final JetService jetService;

    @GetMapping("/jets")
    public String jets(Model model) {
        model.addAttribute("jets", jetService.getAllAvailable());
        return "jets";
    }

    @GetMapping("/jets/{id}")
    public String jetDetail(@PathVariable Long id, Model model) {
        model.addAttribute("jet", jetService.getById(id));
        return "jet-detail";
    }
}
