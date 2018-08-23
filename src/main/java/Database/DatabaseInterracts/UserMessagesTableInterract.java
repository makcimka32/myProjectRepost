package Database.DatabaseInterracts;
import Database.Entities.RequestsEntity;
import Database.Entities.UserMessagesEntity;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class UserMessagesTableInterract {
    private SessionFactory sessionFactory;

    public UserMessagesTableInterract(SessionFactory sessionFactory)
    {
        this.sessionFactory=sessionFactory;
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
   public void saveMessageInDb(UserMessagesEntity userMessagesEntity)
    {
        Session session=sessionFactory.getCurrentSession();
        SQLQuery insertQuery = session.createSQLQuery("INSERT INTO USER_MESSAGES(TITLE_MESSAGE,TEXT_MESSAGE,CREATION_DATE,EDIT_DATE,USER_ID)VALUES(?,?,?,?,?)");

        insertQuery.setParameter(1-1,userMessagesEntity.getTitleMessage());
        insertQuery.setParameter(1,userMessagesEntity.getTextMessage());
        insertQuery.setParameter(2,userMessagesEntity.getCreationDate());
        insertQuery.setParameter(3,userMessagesEntity.getEditDate());
        insertQuery.setParameter(4,userMessagesEntity.getUsersEntity().getUserId());
        insertQuery.executeUpdate();

    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public List<UserMessagesEntity> getAllMessagesFromDb()
    {
        Query query=sessionFactory.getCurrentSession().createQuery("from UserMessagesEntity order by id desc ");
        return query.list();
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public void deleteMessage(Long messageId)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("delete from UserMessagesEntity where messageId=:tempId");
        query.setParameter("tempId",messageId);
        query.executeUpdate();
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public UserMessagesEntity getUserMessageFromDb(Long messageId)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("from UserMessagesEntity where messageId=:tempId");
        query.setParameter("tempId",messageId);
        return (UserMessagesEntity) query.uniqueResult();
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = false)
    public void updateUserMessageIntoDb(UserMessagesEntity userMessagesEntity)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("update UserMessagesEntity set editDate=:tempEditDate,textMessage=:tempTextMessage," +
                "titleMessage=:tempTitleMessage,usersEntity=:tempUserEntity where messageId=:tempMessageId");
        query.setParameter("tempEditDate",userMessagesEntity.getEditDate());
        query.setParameter("tempTextMessage",userMessagesEntity.getTextMessage());
        query.setParameter("tempTitleMessage",userMessagesEntity.getTitleMessage());
        query.setParameter("tempUserEntity",userMessagesEntity.getUsersEntity());
        query.setParameter("tempMessageId",userMessagesEntity.getMessageId());
        query.executeUpdate();
    }
}
