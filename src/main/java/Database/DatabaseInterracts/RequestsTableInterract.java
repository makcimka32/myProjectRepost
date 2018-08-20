package Database.DatabaseInterracts;

import Database.Entities.RequestsEntity;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;



@Transactional(propagation = Propagation.SUPPORTS)
public class RequestsTableInterract {
    private SessionFactory sessionFactory;
    RequestsTableInterract(SessionFactory sessionFactory)
    {
        this.sessionFactory=sessionFactory;
    }

    @Transactional(propagation = Propagation.REQUIRED)
  public   long saveRequestInDb(RequestsEntity requestsEntity)
    {
        Session session=sessionFactory.getCurrentSession();
        SQLQuery insertQuery = session.createSQLQuery("INSERT INTO REQUESTS(PASPORT_NUMBER,PASPORT_SERIA,PASPORT_DATE,PASPORT_WHO_LET,SNILS,REQUEST_TYPE,USER_ID,CREATION_DATE,WORK_STATUS,WORKER)VALUES(?,?,?,?,?,?,?,?,?,?)");

        insertQuery.setParameter(1-1,requestsEntity.getPasportNumber());
        insertQuery.setParameter(1,requestsEntity.getPasportSeria());
        insertQuery.setParameter(2,requestsEntity.getPasportDate());
        insertQuery.setParameter(3,requestsEntity.getPasportWhoLet());
        insertQuery.setParameter(4,requestsEntity.getSnils());
        insertQuery.setParameter(5,requestsEntity.getRequestType());
        insertQuery.setParameter(6,requestsEntity.getUsersEntity().getUserId());
        insertQuery.setParameter(7,requestsEntity.getCreationDate());
        insertQuery.setParameter(8,requestsEntity.getWorkStatus());
        insertQuery.setParameter(9,requestsEntity.getWorker());
        insertQuery.executeUpdate();

        RequestsEntity requestsEntityNewest = (RequestsEntity) session.createCriteria(RequestsEntity.class).addOrder(Order.desc("requestId")).setMaxResults(1).uniqueResult();
        return requestsEntityNewest.getRequestId();

    }
    @Transactional(propagation = Propagation.REQUIRED)
    public List<RequestsEntity> getRequestsByusername(String username)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("from RequestsEntity where usersEntity.username=:tempUsername order by id desc ");
        query.setParameter("tempUsername",username);
        return query.list();

    }
    @Transactional(propagation = Propagation.REQUIRED)
    public RequestsEntity getRequestsByRequestId(Long id)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("from RequestsEntity where requestId=:tempId");
        query.setParameter("tempId",id);
        return (RequestsEntity) query.uniqueResult();
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public long updateRequestFromRequest(RequestsEntity requestsEntity)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("update RequestsEntity set pasportSeria=:tempSeria,pasportNumber=:tempNumber,pasportDate=:tempPasportDate,pasportWhoLet=:tempWhoLet,snils=:tempSnils," +
                "requestType=:tempRequestType,creationDate=:tempCreationDate,workStatus=:tempWorkStatus,usersEntity=:tempUsersEntity where requestId=:tempId");
        query.setParameter("tempSeria",requestsEntity.getPasportSeria());
        query.setParameter("tempNumber",requestsEntity.getPasportNumber());
        query.setParameter("tempPasportDate",requestsEntity.getPasportDate());
        query.setParameter("tempWhoLet",requestsEntity.getPasportWhoLet());
        query.setParameter("tempSnils",requestsEntity.getSnils());
        query.setParameter("tempRequestType",requestsEntity.getRequestType());
        query.setParameter("tempCreationDate",requestsEntity.getCreationDate());
        query.setParameter("tempWorkStatus",requestsEntity.getWorkStatus());
        query.setParameter("tempUsersEntity",requestsEntity.getUsersEntity());
        query.setParameter("tempId",requestsEntity.getRequestId());
        query.executeUpdate();

        return requestsEntity.getRequestId();

    }

    @Transactional(propagation=Propagation.REQUIRED)
    public List<RequestsEntity> getAllRequests()
    {
        Query query=sessionFactory.getCurrentSession().createQuery("from RequestsEntity order by id desc ");
        return query.list();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateWorkStatus(String newWorkStatus,Long id,String worker)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("update RequestsEntity set workStatus=:tempWorkStatus,worker=:tempWorker where requestId=:tempRequestId");
        query.setParameter("tempWorkStatus",newWorkStatus);
        query.setParameter("tempRequestId",id);
        query.setParameter("tempWorker",worker);
        query.executeUpdate();
    }
    @Transactional(propagation = Propagation.REQUIRED)
    public void updateWorkStatusAfterReject(String workStatus,Long id,String worker,String messageToConsumer)
    {
        Query query=sessionFactory.getCurrentSession().createQuery("update RequestsEntity set workStatus=:tempWorkStatus,worker=:tempWorker,messageToCustomer=:tempMessageToConsumer where requestId=:tempRequestId");
        query.setParameter("tempMessageToConsumer",messageToConsumer);
        query.setParameter("tempWorker",worker);
        query.setParameter("tempWorkStatus",workStatus);
        query.setParameter("tempRequestId",id);
        query.executeUpdate();
    }
   @Transactional(propagation = Propagation.REQUIRED)
    public List<RequestsEntity> getWorkerRequestsByUsername(String username)
   {
       Query query=sessionFactory.getCurrentSession().createQuery("from RequestsEntity where worker=:tempWorkerName order by id desc");
       query.setParameter("tempWorkerName",username);
       return query.list();
   }

}
