package src.com.util;

public class MainClass {
	
	public void SendMail(String sub, String body, String from, String to)
	{
		String id = "asplearning17@gmail.com";
		String pass = "sujeeth@17";
		GMailSender sender = new GMailSender(id, pass);
		
		try {
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
		String body ="Hello Class we are trying to test java mail";
		String from ="nbadtest2015@gmail.com";
		String sub ="Testing";
		String id = "nbadtest2015@gmail.com";
		String pass = "UNCCnbad2015";
		String to = "fadi20052002@gmail.com";
		GMailSender sender = new GMailSender(id, pass);
		
		try {
			sender.sendMail(sub, body, from, to);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
