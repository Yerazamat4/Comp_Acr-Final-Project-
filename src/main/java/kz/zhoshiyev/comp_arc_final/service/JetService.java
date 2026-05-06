package kz.zhoshiyev.comp_arc_final.service;

import kz.zhoshiyev.comp_arc_final.entities.Jet;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import kz.zhoshiyev.comp_arc_final.repository.JetRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JetService {

    private final JetRepository jetRepository;

    // все доступные джеты (для страницы jets.html)
    public List<Jet> getAllAvailable() {
        return jetRepository.findByStatus("AVAILABLE");
    }

    // один джет по id (для jet-detail.html)
    public Jet getById(Long id) {
        return jetRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Jet not found"));
    }
}
