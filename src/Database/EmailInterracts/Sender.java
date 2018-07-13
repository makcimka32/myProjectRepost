package Database.EmailInterracts;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Sender {
    private String username;
    private String password;
    private Properties properties;
    public Sender(String username,String password)
    {
        this.username=username;
        this.password=password;
        properties=new Properties();
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port","465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
    }

    public void send(String subject,String text,String toEmail)
    {
        Session session=Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username,password);
            }
        });

        try {
            //формируем сообщение
            Message message=new MimeMessage(session);
            //от кого
            message.setFrom(new InternetAddress(username));
            //куда
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(toEmail));
            //Тема сообщения
            message.setSubject(subject);
            //Текст сообщения
            message.setText(text);
            //отправляем
            Transport.send(message);


        }
        catch (MessagingException e)
        {
            throw new RuntimeException(e);
        }
    }
}
