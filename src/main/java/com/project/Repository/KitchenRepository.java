package com.project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Model.KitchenProducts;

@Repository
public interface KitchenRepository extends JpaRepository<KitchenProducts, Integer> {
}
