/*
package mvc;

import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/services")
public class testRestMyService {
    @Autowired
    UserTableInterract userTableInterract;
@RequestMapping(value = "/{id}",method = RequestMethod.GET)
@ResponseBody
UsersEntity getUserById(@PathVariable("id") long id, Model model)
        {
            return userTableInterract.getUsersFromDbByUserId(id);

        }
}
*/
