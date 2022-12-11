package com.project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Model.GardenProducts;

@Repository
public interface GardenRepository extends JpaRepository<GardenProducts, Integer> {

}
