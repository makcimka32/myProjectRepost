package Database.DatabaseInterracts;

import Database.Entities.UsersEntity;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(propagation = Propagation.SUPPORTS)
public class UserTableInterract {
    SessionFactory sessionFactory;
    UserTableInterract(SessionFactory sessionFactory)
    {
        this.sessionFactory=sessionFactory;
    }
    @Transactional(propagation = Propagation.REQUIRED)
     public   void addUserToDb(UsersEntity usersEntity)
    {
        Session session=sessionFactory.getCurrentSession();
        SQLQuery insertQuery = session.createSQLQuery("INSERT INTO USERS(FIRST_NAME,SECOND_NAME,PHONE_NUMBER,USERNAME,PASSWORD,EMAIL,EMAIL_NEWSLETTER,ENABLED,ROLE)VALUES(?,?,?,?,?,?,?,?,?)");

        insertQuery.setParameter(1-1,usersEntity.getFirstName());

        insertQuery.setParameter(1,usersEntity.getSecondName());
        insertQuery.setParameter(2,usersEntity.getPhoneNumber());
        insertQuery.setParameter(3,usersEntity.getUsername());
        insertQuery.setParameter(4,usersEntity.getPassword());
        insertQuery.setParameter(5,usersEntity.getEmail());
        insertQuery.setParameter(6,usersEntity.isEmailNewsletter());
        insertQuery.setParameter(7,usersEntity.isEnabled());
        insertQuery.setParameter(8,usersEntity.getRole());
        insertQuery.executeUpdate();



    }
    //Получаем все записи с ролью сотрудников
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public List<UsersEntity> getUsersEntityFromDbWithWorkerRole()
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where role=:roleWorker " );
        query.setParameter("roleWorker","ROLE_WORKER_USER");
        return query.list();

    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public boolean getUsersEntityFromDbByUsername(String username)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where username=:tempUsername" );
        query.setParameter("tempUsername",username);
        UsersEntity usersEntity=(UsersEntity) query.uniqueResult();
       if(usersEntity!=null)
           return true;
       else return false;
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public boolean getUsersEntityFromDbByEmail(String email)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where email=:tempEmail" );
        query.setParameter("tempEmail",email);
        UsersEntity usersEntity=(UsersEntity) query.uniqueResult();
        if(usersEntity!=null)
            return true;
        else return false;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public UsersEntity getUsersFromDbByEmail(String email)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where email=:tempEmail" );
        query.setParameter("tempEmail",email);
        UsersEntity usersEntity=(UsersEntity) query.uniqueResult();
        return usersEntity;
    }
    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public UsersEntity getUsersFromDbByUsername(String username)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where username=:tempUsername" );
        query.setParameter("tempUsername",username);
        UsersEntity usersEntity=(UsersEntity) query.uniqueResult();
        return usersEntity;
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    public UsersEntity getUsersFromDbByUserId(Long id)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" from UsersEntity where userId=:tempUserId" );
        query.setParameter("tempUserId",id);
        UsersEntity usersEntity=(UsersEntity) query.uniqueResult();
        return usersEntity;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updatePasswordByEmail(String email,String password)
    {
        Query query=sessionFactory.getCurrentSession().createQuery(" update UsersEntity set password=:newPassword where email=:tempEmail" );
        query.setParameter("newPassword",password);
        query.setParameter("tempEmail",email);
        query.executeUpdate();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateUserInformatin(UsersEntity usersEntity)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("update UsersEntity set secondName=:tempSecondName,firstName=:tempFirstName,username=:tempUsername,password=:tempPassword,phoneNumber=:tempPhoneNumber,email=:tempEmail,emailNewsletter=:tempNewsletter where userId=:tempUserId");
        query.setParameter("tempSecondName",usersEntity.getSecondName());
        query.setParameter("tempFirstName",usersEntity.getFirstName());
        System.out.println(usersEntity.getUsername());
        query.setParameter("tempUsername",usersEntity.getUsername());
        query.setParameter("tempPassword",usersEntity.getPassword());
        query.setParameter("tempPhoneNumber",usersEntity.getPhoneNumber());
        query.setParameter("tempEmail",usersEntity.getEmail());
        query.setParameter("tempNewsletter",usersEntity.isEmailNewsletter());
        query.setParameter("tempUserId",usersEntity.getUserId());
        query.executeUpdate();

    }
}
