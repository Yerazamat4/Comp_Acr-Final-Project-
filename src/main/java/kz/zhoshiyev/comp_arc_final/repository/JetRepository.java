package kz.zhoshiyev.comp_arc_final.repository;

import kz.zhoshiyev.comp_arc_final.entities.Jet;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface JetRepository extends JpaRepository<Jet, Long> {
    List<Jet> findByStatus(String status);
}
