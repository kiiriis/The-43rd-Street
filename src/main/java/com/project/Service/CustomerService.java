package com.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Model.Customer;
import com.project.Repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository custRep;

	// Saving customers
	public Customer saveCustomer(Customer customer) {
		return custRep.save(customer);
	}

	public List<Customer> saveCustomers(List<Customer> customers) {
		return custRep.saveAll(customers);
	}

	// Fetching Customers
	public List<Customer> getCustomers() {
		return custRep.findAll();
	}

	public Customer getCustomerById(int id) {
		return custRep.findById(id).orElse(null);
	}

	// deleting customer
	public void deleteCustomer(int id) {
		custRep.deleteById(id);
	}
	
	public Customer findCust(String userName)
	{
		return custRep.findCustomerByUserName(userName);
	}
}
