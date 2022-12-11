package com.project.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Model.OfficeProducts;

@Repository
public interface OfficeRepository extends JpaRepository<OfficeProducts, Integer> {

}
