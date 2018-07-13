package mvc;

import Database.DatabaseInterracts.UserTableInterract;
import Database.EmailInterracts.Sender;
import Database.Entities.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class AutentificationController {
    UserTableInterract userTableInterract;

    @Autowired
    AutentificationController(UserTableInterract userTableInterract) {
        this.userTableInterract = userTableInterract;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String showLoginPage(Model model) {
        model.addAttribute(new UsersEntity());
        return "login";
    }

    @RequestMapping(value = "/reset", method = RequestMethod.GET)
    public String showForgetPasswordPage() {
        return "resetPasswordByUser";
    }

    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String showForgetPasswordPageHandler(String email, Model model) {
        if (userTableInterract.getUsersEntityFromDbByEmail(email)) {

            UsersEntity usersEntity=userTableInterract.getUsersFromDbByEmail(email);

            //отправляем письмо на почту
            sendMessageToEmail(email,usersEntity);

            return "home";
        } else {

            model.addAttribute("Error", "На данный почтовый адрес нет зарегистрированных пользователей");
            return "resetPasswordByUser";
        }
    }

    private void sendMessageToEmail(String email,UsersEntity usersEntity)
    {
        Sender sender=new Sender("makcimka32@gmail.com","maks198919");
        sender.send("Восстановление пароля на сайте БрянскГипроЗем","На данный почтовый адрес был произведен запрос о восстановлении пароля на нашем сервисе." +
                "\nВаш логин:"+usersEntity.getUsername()+"\nВаш пароль:"+usersEntity.getPassword()+"\nДля дальнейшней работы перейдите по ссылке: http://localhost:8080/login"
                ,email);
    }
}
