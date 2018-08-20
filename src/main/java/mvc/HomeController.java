package mvc;

import Database.DatabaseInterracts.UserTableInterract;
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


@Controller
public class HomeController {
    UserTableInterract userTableInterract;


    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    UserDetailsManager userDetailsManager;

    @Autowired
    HomeController(UserTableInterract userTableInterract)
    {
        this.userTableInterract=userTableInterract;
    }
    @RequestMapping({"/","home"})
    String test()
    {
        return "home";
    }

    @RequestMapping(value ="/createUser",params = "new",method = RequestMethod.GET)
    String createNewUser(Model model)
    {
        UsersEntity usersEntity=new UsersEntity();
        model.addAttribute("usersEntity",usersEntity);

        return "createNewUser";
    }

    @RequestMapping(value = "/createUser",method = RequestMethod.POST)
    String createNewUserPostHandler(@Valid UsersEntity usersEntity, BindingResult bindingResult,Boolean privacyIndicator,Model model)
    {
        //сперва проверяем на правильность ввода
        if(bindingResult.hasErrors())
        {
            System.out.println(bindingResult);
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
            return "home";
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
