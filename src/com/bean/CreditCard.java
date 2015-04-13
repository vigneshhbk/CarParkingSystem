package src.com.bean;

import java.math.BigInteger;

public class CreditCard {

	private BigInteger creditCard;
	private Integer cvv;
	private Integer expirationMonth;
	private Integer expirationYear;
	private String cardName;
	private String cardType;
	public BigInteger getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(BigInteger creditCard) {
		this.creditCard = creditCard;
	}
	public Integer getCvv() {
		return cvv;
	}
	public void setCvv(Integer cvv) {
		this.cvv = cvv;
	}
	public Integer getExpirationMonth() {
		return expirationMonth;
	}
	public void setExpirationMonth(Integer expirationMonth) {
		this.expirationMonth = expirationMonth;
	}
	public Integer getExpirationYear() {
		return expirationYear;
	}
	public void setExpirationYear(Integer expirationYear) {
		this.expirationYear = expirationYear;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	
}
