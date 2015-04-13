package src.com.util;

public class MainClass {
	
	public void SendMail(String sub, String body, String from, String to)
	{
		try {
		String id = "asplearning17@gmail.com";
		String pass = "sujeeth@17";
		GMailSender sender = new GMailSender(id, pass);
		
			sender.sendMail(sub, body, from, to);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		  //mail start 
		 
		try{
		  MainClass sendMail = new MainClass();
		  String sub = "Test mail";
		  String body = "Test mail";
		  String from = "asplearning17@gmail.com";
		  String to = "k.sampathsree@gmail.com";
		  sendMail.SendMail(sub, body, from, to);
		}
		catch(Exception ex)
		{
			
		}
		  

		

	}

}
