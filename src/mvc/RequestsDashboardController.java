package mvc;

import Database.DatabaseInterracts.RequestsTableInterract;
import Database.DatabaseInterracts.UserTableInterract;
import Database.EmailInterracts.Sender;
import Database.Entities.RequestsEntity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RequestsDashboardController {

    private RequestsTableInterract requestsTableInterract;
    private UserTableInterract userTableInterract;
    @Autowired
    RequestsDashboardController(RequestsTableInterract requestsTableInterract,UserTableInterract userTableInterract)
    {
        this.requestsTableInterract=requestsTableInterract;
        this.userTableInterract=userTableInterract;
    }
    @RequestMapping("/allRequestInSystem")
    String showAllRequestInSystem(Model model)
    {
        List<RequestsEntity> requestsEntities=requestsTableInterract.getAllRequests();
        model.addAttribute("requestsEntities",requestsEntities);
        return "allRequestsInSystem";
    }




    @RequestMapping("/rejectRequest")
    String rejectRequestWithId(@RequestParam(value = "requestId",required = true)Long requestId, Model model)
    {
        model.addAttribute("requestEntity",requestsTableInterract.getRequestsByRequestId(requestId));
        return "errorMessage";

    }

    @RequestMapping(value = "/rejectRequest",method = RequestMethod.POST)
    String rejectRequestWithIdHandler(@Valid RequestsEntity requestsEntity, BindingResult bindingResult, Model model)
    {
        //заполняем создателя заявки
        requestsEntity.setUsersEntity(requestsTableInterract.getRequestsByRequestId(requestsEntity.getRequestId()).getUsersEntity());
        //проверяем корректность заполнения
        if(bindingResult.hasErrors())
        {   model.addAttribute("requestEntity",requestsEntity);
            model.addAttribute("errorSize","Сообщение должно состоять от 0 до 200 знаков");
            System.out.println(bindingResult);
            return "errorMessage";
        }

        Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
        String currentUser=authentication.getName();
        //обновляем базу данных
        requestsTableInterract.updateWorkStatusAfterReject("Отклонена",requestsEntity.getRequestId(),currentUser,requestsEntity.getMessageToCustomer());

        //посылаем сообщение на почту
        Sender sender=new Sender("makcimka32@gmail.com","maks198919");

        sender.send("Ваша заявка с номером:"+requestsEntity.getRequestId()+" переведена в статус 'Отклонена'", "Заявка переведена в статус 'Отклонена' по причине:"+requestsEntity.getMessageToCustomer()+"\n" +
                "Пожалуйста, отредактируйте вашу заявку в личном кабинете.\nС уважением,БрянскГипроЗем." ,requestsEntity.getUsersEntity().getEmail());
        return "redirect:/allRequestInSystem";

    }

   /* @RequestMapping("/rejectRequest/{requestId}")
    String rejectRequest(@PathVariable(value = "requestId")Long requestId, @RequestParam(value = "username") String username)
    {
       requestsTableInterract.updateWorkStatus("Отклонена",requestId,username);
       return "redirect:/allRequestInSystem";
    }*/
    @RequestMapping("/handleRequest/{requestId}")
    String handleRequest(@PathVariable(value = "requestId")Long requestId, @RequestParam(value = "username") String username)
    {
        requestsTableInterract.updateWorkStatus("В обработке",requestId,username);
        return "redirect:/allRequestInSystem";
    }
    @RequestMapping("/executeRequest/{requestId}")
    String executeRequest(@PathVariable(value = "requestId")Long requestId, @RequestParam(value = "username") String username)
    {
        requestsTableInterract.updateWorkStatus("Исполняется",requestId,username);
        return "redirect:/allRequestInSystem";
    }
    @RequestMapping("/performRequest/{requestId}")
    String performRequest(@PathVariable(value = "requestId")Long requestId, @RequestParam(value = "username") String username)
    {
        requestsTableInterract.updateWorkStatus("Выполнена",requestId,username);
        Sender sender=new Sender("makcimka32@gmail.com","maks198919");

        sender.send("Ваша заявка с номером:"+requestId+" переведена в статус 'Выполнена'", "Заявка переведена в статус 'Выполнена'\n" +
                "Пожалуйста, явитесь в наш офис за получением документов.\nС уважением,БрянскГипроЗем." ,requestsTableInterract.getRequestsByRequestId(requestId).getUsersEntity().getEmail());
        return "redirect:/allRequestInSystem";
    }

}
