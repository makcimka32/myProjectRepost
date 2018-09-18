package Database.EmailInterracts;

public class SenderSimpleMailThread implements Runnable {
    Sender sender;
    String subject;
    String message;
    String toMail;
    Thread thread;
    public SenderSimpleMailThread(Sender sender,String subject,String message,String toMail)
    {
        this.thread=new Thread(this,"Поток отправки сообщений");
        this.sender=sender;
        this.subject=subject;
        this.message=message;
        this.toMail=toMail;
        this.thread.start();
    }

    @Override
    public void run() {
         sender.send(subject,message,toMail);
    }
}
