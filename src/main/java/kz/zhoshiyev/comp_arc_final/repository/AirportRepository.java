package kz.zhoshiyev.comp_arc_final.repository;

import kz.zhoshiyev.comp_arc_final.entities.Airport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AirportRepository extends JpaRepository<Airport, Long> {
}
