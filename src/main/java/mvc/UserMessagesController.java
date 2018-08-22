package mvc;

import Database.DatabaseInterracts.UserMessagesTableInterract;
import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.UserMessagesEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.security.Principal;
import java.sql.Date;


@Controller
public class UserMessagesController {
    UserMessagesTableInterract userMessagesTableInterract;
    UserTableInterract userTableInterract;
    @Autowired
    UserMessagesController(UserMessagesTableInterract userMessagesTableInterract,UserTableInterract userTableInterract)
    {
        this.userTableInterract=userTableInterract;
        this.userMessagesTableInterract=userMessagesTableInterract;
    }
    @RequestMapping("/createNewMessage")
    String messageCreationController(Model model)
    {
        model.addAttribute("userMessagesEntity",new UserMessagesEntity());
        return "messageCreationPage";
    }
    @RequestMapping(value = "/createMessage",method = RequestMethod.POST)
    String messageHandler(@Valid UserMessagesEntity userMessagesEntity, BindingResult bindingResult,Principal principal)
    {
        ///проверяем корректность заполнения формы
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult);
            return "messageCreationPage";
        }

       userMessagesEntity.setCreationDate(new Date(System.currentTimeMillis()));
        userMessagesEntity.setEditDate(new Date(System.currentTimeMillis()));

        userMessagesEntity.setUsersEntity(userTableInterract.getUsersFromDbByUsername(principal.getName()));
        userMessagesTableInterract.saveMessageInDb(userMessagesEntity);
        return  "redirect:/home";
    }
}
