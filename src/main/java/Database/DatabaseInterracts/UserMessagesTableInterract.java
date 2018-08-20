package Database.DatabaseInterracts;

import org.hibernate.SessionFactory;

public class UserMessagesTableInterract {
    private SessionFactory sessionFactory;
    public UserMessagesTableInterract(SessionFactory sessionFactory)
    {
        this.sessionFactory=sessionFactory;
    }
}
