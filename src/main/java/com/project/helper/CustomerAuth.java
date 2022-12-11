package com.project.helper;

import java.util.List;

import com.project.Model.Customer;

public class CustomerAuth {

	public boolean authCustomer(String userName, String password, List<Customer> allCustomers) {

		for (Customer tempCust : allCustomers) {
			if (password.equals(tempCust.getPassword())
					&& userName.equals(tempCust.getUserName())) {
				return true;
			}
		}

		return false;

	}

	public boolean authSignup(String userName, String mail, List<Customer> allCustomers) {
		for (Customer tempCust : allCustomers) {
			if (userName.equals(tempCust.getUserName()) || mail.equals(tempCust.getMail()))
				return true;
		}
		return false;
	}

	public boolean isAdmin(String userName, String password) {
		// TODO Auto-generated method stub
		if(userName.equals("admin") && password.equals("admin2202"))
			return true;
		return false;
	}

}
