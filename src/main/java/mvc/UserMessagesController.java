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
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;


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
            return "messageCreationPage";
        }
        //Если новая новость
        if(userMessagesEntity.getMessageId()==0)
        {

            try {
                String newStringText=new String(userMessagesEntity.getTextMessage().getBytes("UTF-16"),"UTF-8");
                String newStringTitle=new String(userMessagesEntity.getTitleMessage().getBytes("UTF-16"),"UTF-8");

                userMessagesEntity.setTextMessage(newStringText);
                userMessagesEntity.setTitleMessage(newStringTitle);

                userMessagesEntity.setCreationDate(new Timestamp(System.currentTimeMillis()));
                userMessagesEntity.setEditDate(new Timestamp(System.currentTimeMillis()));

                userMessagesEntity.setUsersEntity(userTableInterract.getUsersFromDbByUsername(principal.getName()));
                userMessagesTableInterract.saveMessageInDb(userMessagesEntity);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }
        //Если новость после редактирования
        else {
            String newStringText= null;
            try {
                newStringText = new String(userMessagesEntity.getTextMessage().getBytes("UTF-16"),"UTF-8");
                String newStringTitle=new String(userMessagesEntity.getTitleMessage().getBytes("UTF-16"),"UTF-8");

                userMessagesEntity.setTextMessage(newStringText);
                userMessagesEntity.setTitleMessage(newStringTitle);

                userMessagesEntity.setEditDate(new Timestamp(System.currentTimeMillis()));
                userMessagesEntity.setUsersEntity(userTableInterract.getUsersFromDbByUsername(principal.getName()));
                userMessagesTableInterract.updateUserMessageIntoDb(userMessagesEntity);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }

        return  "redirect:/";
    }

    @RequestMapping(value = "/deleteNews",method = RequestMethod.POST)
    String deleteMessageHandler(@RequestParam Long messageId)
    {
        userMessagesTableInterract.deleteMessage(messageId);

        return "redirect:/";
    }
    @RequestMapping(value = "/editNews",method = RequestMethod.GET)
    String editMessage(@RequestParam Long messageId,Model model)
    {
        model.addAttribute ("userMessagesEntity", userMessagesTableInterract.getUserMessageFromDb(messageId));
        return "messageCreationPage";
    }
    @RequestMapping(value = "/news",method = RequestMethod.GET)
    String showNewsInfo(@RequestParam Long messageId,Model model)
    {
        UserMessagesEntity userMessagesEntity=userMessagesTableInterract.getUserMessageFromDb(messageId);
        ArrayList<UserMessagesEntity> userMessagesEntities=userMessagesTableInterract.getLastThreeNews();

        System.out.println(userMessagesEntity.getEditDate());
        model.addAttribute("userMessagesEntities",userMessagesEntities);
        model.addAttribute("mainNews",userMessagesEntity);

        return "showNews";
    }
}
