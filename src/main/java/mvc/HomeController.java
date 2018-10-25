package mvc;

import Database.DatabaseInterracts.UserMessagesTableInterract;
import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.UserMessagesEntity;
import Database.Entities.UsersEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;

import org.springframework.security.core.context.SecurityContextHolder;


import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Controller
public class HomeController {
    UserTableInterract userTableInterract;
    UserMessagesTableInterract userMessagesTableInterract;

    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    UserDetailsManager userDetailsManager;

    @Autowired
    HomeController(UserTableInterract userTableInterract, UserMessagesTableInterract userMessagesTableInterract)
    {
        this.userTableInterract=userTableInterract;
        this.userMessagesTableInterract=userMessagesTableInterract;
    }
    @RequestMapping({"/"})
    String test(@RequestParam(value = "pageNumber",defaultValue = "0") long pageNumber,Model model)
    {
        List<UserMessagesEntity> userMessagesEntities=  userMessagesTableInterract.getAllMessagesFromDb();
        int messagesCount=userMessagesEntities.size();

        ArrayList<UserMessagesEntity> messagiesEntitesForView=new ArrayList<>();
        //добавляем в коллекцию необходимый десяток новостей
        for(int i=0;i<10;i++)
        {
            try{
                messagiesEntitesForView.add(userMessagesEntities.get((int)(10*pageNumber+i)));
            }
            catch (IndexOutOfBoundsException e)
            {
                break;
            }
        }
        //заполняем последнюю страницу
        int endPageNumber=(int)pageNumber;
        int currentMessages=(int)(messagesCount-10*(pageNumber+1));
        while (currentMessages>0) {
            currentMessages-=10;
            endPageNumber+=1;
        }


        model.addAttribute("messagesCount",messagesCount);
        model.addAttribute("pageNumber",pageNumber);
        model.addAttribute("endPageNumber",endPageNumber);
        model.addAttribute("userMessagesEntities",messagiesEntitesForView);

        return "home";
    }

    @RequestMapping(value ="/createUser",params = "new",method = RequestMethod.GET)
    String createNewUser(Model model)
    {
        UsersEntity usersEntity=new UsersEntity();
        model.addAttribute("usersEntity",usersEntity);

        return "createNewUser";
    }
    @RequestMapping(value = "/createAdminUser",params = "new",method = RequestMethod.GET)
    String createNewAdminUser(Model model)
    {
        UsersEntity usersEntity=new UsersEntity();
        model.addAttribute("usersEntity",usersEntity);
        return "createNewAdminUser";
    }

    @RequestMapping(value = "/createAdminUser",method = RequestMethod.POST)
    String createAdminUserPost(@Valid UsersEntity usersEntity,BindingResult bindingResult,Model model)
    {
        if(bindingResult.hasErrors())
        {
            return "createNewAdminUser";
        }
        //проверяем пользователя в БД по имени
        if(userTableInterract.getUsersEntityFromDbByUsername(usersEntity.getUsername())|| userTableInterract.getUsersEntityFromDbByEmail(usersEntity.getEmail()))
        {
            if(userTableInterract.getUsersEntityFromDbByUsername(usersEntity.getUsername()))
            {
                model.addAttribute("usernameErrorMessage","Пользователь с таким именем уже присутствует в системе");
            }
            if(userTableInterract.getUsersEntityFromDbByEmail(usersEntity.getEmail()))
            {
                model.addAttribute("emailErrorMessage","Аккаунт с такой почтой уже зарегистрирован");
            }

            return "createNewAdminUser";
        }

        usersEntity.setRole("ROLE_WORKER_USER");
        usersEntity.setEnabled(true);
        userTableInterract.addUserToDb(usersEntity);

        return "redirect:/";
    }

    @RequestMapping(value = "/createUser",method = RequestMethod.POST)
    String createNewUserPostHandler(@Valid UsersEntity usersEntity, BindingResult bindingResult,Boolean privacyIndicator,Model model)
    {
        //сперва проверяем на правильность ввода
        if(bindingResult.hasErrors())
        {
            return "createNewUser";
        }
        if(usersEntity.getUserId()==0)
        {
            //проверяем пользователя в БД по имени
            if(privacyIndicator==null||userTableInterract.getUsersEntityFromDbByUsername(usersEntity.getUsername())|| userTableInterract.getUsersEntityFromDbByEmail(usersEntity.getEmail()))
            {
                if(userTableInterract.getUsersEntityFromDbByUsername(usersEntity.getUsername()))
                {
                    model.addAttribute("usernameErrorMessage","Пользователь с таким именем уже присутствует в системе");
                }
                if(userTableInterract.getUsersEntityFromDbByEmail(usersEntity.getEmail()))
                {
                    model.addAttribute("emailErrorMessage","Аккаунт с такой почтой уже зарегистрирован");
                }
                if(privacyIndicator==null)
                {
                    model.addAttribute("privacyError","Примите условия пользовательского соглашения");
                }
                return "createNewUser";
            }

            usersEntity.setRole("ROLE_DEFAULT_USER");
            usersEntity.setEnabled(true);

            userTableInterract.addUserToDb(usersEntity);
            return "redirect:/";
        }
        else {
            UsersEntity tempEntity=userTableInterract.getUsersFromDbByUserId(usersEntity.getUserId());
            usersEntity.setUsername(tempEntity.getUsername());

            if(userTableInterract.getUsersEntityFromDbByEmail(usersEntity.getEmail())&!(tempEntity.getEmail().equals(usersEntity.getEmail())))
            {
                model.addAttribute("emailErrorMessage","Аккаунт с такой почтой уже зарегистрирован");
                return "createNewUser";
            }


            userTableInterract.updateUserInformatin(usersEntity);
            return "redirect:/j_spring_security_logout";

        }

    }
    @RequestMapping(value = "/aboutUs",method = RequestMethod.GET)
    String aboutUsPageGeter(Model model)
    {
        return "aboutUsPage";
    }
    @RequestMapping(value = "/BRGZPrivacy",method = RequestMethod.GET)
    String privacyBRGZGet(Model model)
    {
        return "BRGZPrivacy";
    }
}
