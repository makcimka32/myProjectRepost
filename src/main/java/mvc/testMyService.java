/*
package mvc;

import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.List;

@Component
@WebService(serviceName = "testService")
public class testMyService {
    @Autowired
    UserTableInterract userTableInterract;

    @WebMethod
    public List<UsersEntity> getUsersFromService()
    {
        return userTableInterract.getUsersEntityFromDbWithWorkerRole();
    }

}
*/
