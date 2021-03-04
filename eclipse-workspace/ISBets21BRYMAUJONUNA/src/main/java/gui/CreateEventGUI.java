package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Frame;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import com.toedter.calendar.JCalendar;

import businessLogic.BLFacade;
import configuration.UtilDate;
import domain.Event;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.awt.event.ActionEvent;
import java.beans.PropertyChangeListener;
import java.text.DateFormat;
import java.beans.PropertyChangeEvent;

public class CreateEventGUI extends JFrame {

	private JPanel contentPane;
	private JTextField textEvento;
	private static BLFacade facade = LoginGUI.getBusinessLogic();
	private Calendar calendarAct = null;
	private Calendar calendarAnt = null;

	public static void setBusinessLogic(BLFacade pfacade) {
		facade = pfacade;
	}

	public static BLFacade getBusinessLogic() {
		return facade;
	}
	public CreateEventGUI() {
		setTitle("Crear evento");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 585, 407);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JCalendar jCalendar1 = new JCalendar();
		jCalendar1.addPropertyChangeListener(new PropertyChangeListener() {
			public void propertyChange(PropertyChangeEvent evt) {
				if (evt.getPropertyName().equals("locale")) {
					jCalendar1.setLocale((Locale) evt.getNewValue());
				} else if (evt.getPropertyName().equals("calendar")) {
					calendarAnt = (Calendar) evt.getOldValue();
					calendarAct = (Calendar) evt.getNewValue();

					int monthAnt = calendarAnt.get(Calendar.MONTH);
					int monthAct = calendarAct.get(Calendar.MONTH);
					if (monthAct!=monthAnt) {
						if (monthAct==monthAnt+2) { 
							// Si en JCalendar estÃ¡ 30 de enero y se avanza al mes siguiente, devolverÃ­a 2 de marzo (se toma como equivalente a 30 de febrero)
							// Con este cÃ³digo se dejarÃ¡ como 1 de febrero en el JCalendar
							calendarAct.set(Calendar.MONTH, monthAnt+1);
							calendarAct.set(Calendar.DAY_OF_MONTH, 1);
						}

						jCalendar1.setCalendar(calendarAct);

					}

				}
			}
		});
		jCalendar1.setBounds(163, 30, 266, 175);
		contentPane.add(jCalendar1);

		JLabel lblNewLabel = new JLabel("Introduzca fecha:");
		lblNewLabel.setBounds(41, 115, 103, 14);
		contentPane.add(lblNewLabel);

		JLabel lblNewLabel_1 = new JLabel("Introduzca partido:");
		lblNewLabel_1.setBounds(41, 243, 95, 14);
		contentPane.add(lblNewLabel_1);

		textEvento = new JTextField();
		textEvento.setBounds(163, 240, 266, 20);
		contentPane.add(textEvento);
		textEvento.setColumns(10);

		JButton btnCrearEvento = new JButton("Crear evento");
		btnCrearEvento.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Date date= jCalendar1.getDate();
				date.setHours(0);
				date.setMinutes(0);
				date.setSeconds(0);
				Event ev=new Event(facade.getNumberEvents() + 1, textEvento.getText(), date);
				if(!facade.existEvent(ev)) {
					JOptionPane.showMessageDialog(contentPane, "Evento a�adido correctamente");
					facade.insertEvent(ev);
					Frame gui = new MainAdminGUI();
					gui.setAlwaysOnTop(true);
					gui.setVisible(true);
					close();
				} else {
					JOptionPane.showMessageDialog(contentPane, "Evento ya existente");
				}
				

			}
		});
		btnCrearEvento.setBounds(220, 310, 113, 23);
		contentPane.add(btnCrearEvento);
	}
	
	public void close() {
		this.setVisible(false);
	}
	
}
