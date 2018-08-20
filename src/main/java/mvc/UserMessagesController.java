package mvc;

import Database.DatabaseInterracts.UserTableInterract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserMessagesController {
    UserTableInterract userTableInterract;
    @Autowired
    UserMessagesController(UserTableInterract userTableInterract)
    {
        this.userTableInterract=userTableInterract;
    }
    @RequestMapping("/createNewMessage")
    String messageCreationController(Model model)
    {
        return "messageCreationPage";
    }
}
