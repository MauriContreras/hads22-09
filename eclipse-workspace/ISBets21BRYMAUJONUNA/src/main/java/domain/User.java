package domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private String userName;
	private String userPass;

	private String firstName;
	private String lastName;
	private String birthDate;

	private String email;
	private String bankAccount;
	private Integer phoneNumb;

	private String address;
	private Integer type;

	public User(String userName, String userPass, String firstName, String lastName, String birthDate,
			String email, String bankAccount, Integer phoneNumber, String address) {
		this.userName = userName;
		this.userPass = userPass;

		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDate = birthDate;

		this.email = email;
		this.bankAccount = bankAccount;
		this.phoneNumb = phoneNumber;

		this.address = address;
		type = 0;
	}
	
	public void setAdmin() {
		type = 1;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public Integer getPhoneNumb() {
		return phoneNumb;
	}

	public void setPhoneNumb(Integer phoneNumb) {
		this.phoneNumb = phoneNumb;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getType() {
		return type;
	}

}
