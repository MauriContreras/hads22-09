package businessLogic;

import java.util.ArrayList;
//hola
import java.util.Date;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.jws.WebMethod;
import javax.jws.WebService;

import configuration.ConfigXML;
import dataAccess.DataAccess;
import domain.Question;
import domain.User;
import domain.Event;
import domain.Forecast;
import exceptions.EventFinished;
import exceptions.IncorrectPassException;
import exceptions.QuestionAlreadyExist;
import exceptions.UserAlreadyExistException;
import exceptions.UserDoesNotExistException;

/**
 * It implements the business logic as a web service.
 */
@WebService(endpointInterface = "businessLogic.BLFacade")
public class BLFacadeImplementation implements BLFacade {
	DataAccess dbManager;

	public BLFacadeImplementation() {
		System.out.println("Creating BLFacadeImplementation instance");
		ConfigXML c = ConfigXML.getInstance();

		if (c.getDataBaseOpenMode().equals("initialize")) {
			dbManager = new DataAccess(c.getDataBaseOpenMode().equals("initialize"));
			dbManager.initializeDB();
			dbManager.close();
		}

	}

	public BLFacadeImplementation(DataAccess da) {

		System.out.println("Creating BLFacadeImplementation instance with DataAccess parameter");
		ConfigXML c = ConfigXML.getInstance();

		if (c.getDataBaseOpenMode().equals("initialize")) {
			da.open(true);
			da.initializeDB();
			da.close();

		}
		dbManager = da;
	}

	/**
	 * This method creates a question for an event, with a question text and the
	 * minimum bet
	 * 
	 * @param event      to which question is added
	 * @param question   text of the question
	 * @param betMinimum minimum quantity of the bet
	 * @return the created question, or null, or an exception
	 * @throws EventFinished        if current data is after data of the event
	 * @throws QuestionAlreadyExist if the same question already exists for the
	 *                              event
	 */
	@WebMethod
	public Question createQuestion(Event event, String question, float betMinimum)
			throws EventFinished, QuestionAlreadyExist {

		// The minimum bed must be greater than 0
		dbManager.open(false);
		Question qry = null;

		if (new Date().compareTo(event.getEventDate()) > 0)
			throw new EventFinished(ResourceBundle.getBundle("Etiquetas").getString("ErrorEventHasFinished"));

		qry = dbManager.createQuestion(event, question, betMinimum);

		dbManager.close();

		return qry;
	};

	/**
	 * This method invokes the data access to retrieve the events of a given date
	 * 
	 * @param date in which events are retrieved
	 * @return collection of events
	 */
	@WebMethod
	public Vector<Event> getEvents(Date date) {
		dbManager.open(false);
		Vector<Event> events = dbManager.getEvents(date);
		dbManager.close();
		return events;
	}

	/**
	 * This method invokes the data access to retrieve the dates a month for which
	 * there are events
	 * 
	 * @param date of the month for which days with events want to be retrieved
	 * @return collection of dates
	 */
	@WebMethod
	public Vector<Date> getEventsMonth(Date date) {
		dbManager.open(false);
		Vector<Date> dates = dbManager.getEventsMonth(date);
		dbManager.close();
		return dates;
	}

	public void close() {
		DataAccess dB4oManager = new DataAccess(false);

		dB4oManager.close();

	}

	/**
	 * This method invokes the data access to initialize the database with some
	 * events and questions. It is invoked only when the option "initialize" is
	 * declared in the tag dataBaseOpenMode of resources/config.xml file
	 */
	@WebMethod
	public void initializeBD() {
		dbManager.open(false);
		dbManager.initializeDB();
		dbManager.close();
	}

	public User login(String userName, String password) throws UserDoesNotExistException, IncorrectPassException {
		dbManager.open(false);
		User login = dbManager.login(userName, password);
		dbManager.close();
		return login;
	}

//	public boolean validoUsuario(String puser) {
//		dbManager.open(false);
//		boolean usuarioBD = dbManager.validoUsuario(puser);
//		dbManager.close();
//		return usuarioBD;
//	}
	
	public User registrar(String user,String pass,String name,String lastName,String birthDate,String email,String account,Integer numb,String address) throws UserAlreadyExistException {
		dbManager.open(false);
		User u = dbManager.registrar(user, pass, name, lastName, birthDate, email, account, numb, address);
		dbManager.close();
		return u;
	}
	
	public boolean insertEvent(Event pEvento) {
		dbManager.open(false);
		boolean inserted = dbManager.insertEvent(pEvento);
		dbManager.close();
		
		return inserted;
	}
	public int getNumberEvents() {
		dbManager.open(false);
		int n = dbManager.getNumberEvents();
		dbManager.close();
		return n;
	}
	
	public boolean existEvent(Event event) {
		dbManager.open(false);
		boolean result = dbManager.existEvent(event);
		dbManager.close();
		return result;
	}
	
	public int getNumberForecasts() {
		dbManager.open(false);
		int n = dbManager.getNumberForecasts();
		dbManager.close();
		return n;
	}
	
	public boolean existForecast(Forecast f) {
		dbManager.open(false);
		boolean result = dbManager.existForecast(f);
		dbManager.close();
		return result;
	}
	
	public boolean insertForecast(Forecast f) {
		dbManager.open(false);
		boolean inserted = dbManager.insertForecast(f);
		dbManager.close();
		return inserted;
	}
}
