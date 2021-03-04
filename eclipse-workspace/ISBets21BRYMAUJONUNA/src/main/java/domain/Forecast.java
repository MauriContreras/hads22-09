package domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Forecast {
	@Id
	private Integer forecastNumber;
	private String forecast;
	private Question question;
	
	
	public Forecast(int n, String s, Question q) {
		forecast = s;
		question = q;
		forecastNumber = n;
	}
	
	public Forecast(String s, Question q) {
		forecast = s;
		question = q;
	}
	
	public String getForecast() {
		return forecast;
	}
	
	public void setForecast(String s) {
		forecast = s;
	}
	
	public Question getQuestion() {
		return question;
	}
	
	public void setQuestion(Question q) {
		question = q;
	}
	
	public Integer getForecastNumber() {
		return forecastNumber;
	}
	
	public void setForecastNumber(int n) {
		forecastNumber = n;
	}
	
	public String toString(){
		return forecastNumber + ";" + question.toString()+"; Forecast: "+forecast;
	}
}
