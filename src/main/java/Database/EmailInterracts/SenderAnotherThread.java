package Database.EmailInterracts;

import Database.Entities.UsersEntity;

import java.util.ArrayList;

public class SenderAnotherThread implements Runnable{
    Sender sender;
    String subject;
    String textMessage;
    ArrayList<UsersEntity> toMail;
    Thread thread;
   public SenderAnotherThread(Sender sender,String subject,String textMessage,ArrayList<UsersEntity> toMail)
    {
        thread=new Thread(this,"Поток отправки сообщений");
        this.sender=sender;
        this.subject=subject;
        this.textMessage=textMessage;
        this.toMail=toMail;
        thread.start();
    }
    @Override
    public void run() {
        for (UsersEntity temp: toMail
             ) {
            sender.send(subject,textMessage,temp.getEmail());
        }

    }
}
