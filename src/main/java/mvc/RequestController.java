package mvc;

import Database.DatabaseInterracts.RequestsTableInterract;
import Database.DatabaseInterracts.UserTableInterract;
import Database.EmailInterracts.Sender;
import Database.EmailInterracts.SenderAnotherThread;
import Database.EmailInterracts.SenderSimpleMailThread;
import Database.Entities.RequestsEntity;
import Database.Entities.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Principal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class RequestController {
    RequestsTableInterract requestsTableInterract;
    UserTableInterract userTableInterract;

    @Autowired
    RequestController(RequestsTableInterract requestsTableInterract, UserTableInterract userTableInterract) {
        this.requestsTableInterract = requestsTableInterract;
        this.userTableInterract = userTableInterract;
    }

    @RequestMapping(value = "/createNewRequest", method = RequestMethod.GET)
    String createRequest(Model model) {
        model.addAttribute(new RequestsEntity());
        return "createNewRequestPage";
    }

    //Обрабатывает вставку и обновление заявки
    @RequestMapping(value = "/createNewRequest", method = RequestMethod.POST)
    String createRequestHandler(@Valid RequestsEntity requestsEntity, BindingResult bindingResult, @RequestParam(value = "files", required = false) List<MultipartFile> files, String username, Model model) {


        //проверяем корректность заполнения формы
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult);
            return "createNewRequestPage";
        }

        //Проверяем на соответствие формату изображения
        for (int i = 0; i < files.size(); i++) {
            if (files.get(i).isEmpty()) continue;
            if (!files.get(i).getContentType().equals("image/jpeg") && !files.get(i).getContentType().equals("image/png")) {
                model.addAttribute("fileError", "Загружаемые файлы должы быть в формате png или jpg или pdf");
                return "createNewRequestPage";
            }
        }

        //Если id=0, то вставляем новую запись
        if (requestsEntity.getRequestId() == 0) {
            //Сохраняем заявку в БД
            // вставляем в заявку,кто создал ее
            requestsEntity.setUsersEntity(userTableInterract.getUsersFromDbByUsername(username));
            requestsEntity.setCreationDate(new Timestamp(System.currentTimeMillis()));
            requestsEntity.setWorkStatus("В обработке");
            long idRequest = requestsTableInterract.saveRequestInDb(requestsEntity);

            //создаем папку данного пользователя с заказами сперва проверяя имеется ли таковая в системе
            File file = new File("C:\\BRGZ\\" + username + "\\" + idRequest+"\\");
            //Если папки пользователя нет, то создаем ее
            if (!file.exists()) {
                file.mkdirs();
            }
            //сохраняем файлы в файловой системе
            saveFilesInDirectory(files, username, idRequest);
            //Почтовая рассылка
            requestsEntity=requestsTableInterract.getRequestsByRequestId(idRequest);
            sendMailToAllWorkers(requestsEntity,"В систему поступила новая заявка с id:"+requestsEntity.getRequestId(),"В систему поступила заявка с Id:"+requestsEntity.getRequestId()+" со следующим типом работ:"+requestsEntity.getRequestType()+"\nАвтор заявки:"+requestsEntity.getUsersEntity().getUsername()+"\nДата создания:"+requestsEntity.getCreationDate()+"\nС уважением,БрянскГипроЗем");
            return "redirect:/";
        } else {
            requestsEntity.setUsersEntity(userTableInterract.getUsersFromDbByUsername(username));
            requestsEntity.setCreationDate(new Timestamp(System.currentTimeMillis()));
            long idRequest = requestsTableInterract.updateRequestFromRequest(requestsEntity);


            requestsEntity=requestsTableInterract.getRequestsByRequestId(idRequest);

            //создаем папку данного пользователя с заказами сперва проверяя имеется ли таковая в системе
            File file = new File("C:\\BRGZ\\" + username + "\\" + idRequest+"\\");
            //Если папки пользователя нет, то создаем ее
            if (!file.exists()) {
                file.mkdirs();
            }
            //сохраняем файлы в файловой системе

            if(!(files.get(0).getOriginalFilename().isEmpty()))
            {
                saveFilesInDirectory(files, username, idRequest);
            }

            //Отправляем письмо исполнителю
            sendMailToWorker(requestsEntity,"Заявка с Id:"+requestsEntity.getRequestId()+" имзенена","Заявка с Id:"+requestsEntity.getRequestId()+" имзенена\nОзнакомтесь с изменениями в личном кабинете или на доске заявок\nС уважением,БрянскГипроЗем");

            return "redirect:/privateOffice?username="+username;
        }
    }
    //сохраняем файлы
    void saveFilesInDirectory(List<MultipartFile> files, String username, long idRequest) {
        for (int i = 0; i < files.size(); i++) {
            try {
                File tempFile = new File("C:\\BRGZ\\" + username + "\\" + idRequest + "\\", files.get(i).getOriginalFilename());
                FileOutputStream fileOutputStream = new FileOutputStream(tempFile);
                byte b[] = new byte[0];
                b = files.get(i).getBytes();
                fileOutputStream.write(b);
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    void sendMailToAllWorkers(RequestsEntity requestsEntity,String messageTitle,String messageText)
    {
        Sender sender=new Sender("makcimka32@gmail.com","maks198919");
        ArrayList<UsersEntity> usersEntityArrayList = (ArrayList<UsersEntity>) userTableInterract.getUsersEntityFromDbWithWorkerRole();
        SenderAnotherThread senderAnotherThread=new SenderAnotherThread(sender,messageTitle,messageText,usersEntityArrayList);

    }
    void sendMailToWorker(RequestsEntity requestsEntity,String messageTitle,String messageText)
    {
        Sender sender=new Sender("makcimka32@gmail.com","maks198919");
        UsersEntity usersEntity=userTableInterract.getUsersFromDbByUsername(requestsEntity.getWorker());
        SenderSimpleMailThread senderSimpleMailThread=new SenderSimpleMailThread(sender,messageTitle,messageText,usersEntity.getEmail());
        sender.send(messageTitle,messageText,usersEntity.getEmail());
    }

    @RequestMapping(value = "/requestDetail")
    String showDetailsOfRequest(@RequestParam(value = "requestId") Long id, Model model, Principal principal)
    {
        RequestsEntity requestsEntity=requestsTableInterract.getRequestsByRequestId(id);

        if(!requestsEntity.getUsersEntity().getUsername().equals(principal.getName())&& !userTableInterract.getUsersEntityFromDbWithWorkerRole().contains(userTableInterract.getUsersFromDbByUsername(principal.getName())))
        {
            return "home";
        }
        model.addAttribute("requestEntity",requestsEntity);
        File file=new File("C:\\BRGZ\\"+requestsEntity.getUsersEntity().getUsername()+"\\"+requestsEntity.getRequestId()+"\\");
        String [] fileNames=file.list();
        model.addAttribute("requestEntity",requestsEntity);
        model.addAttribute("fileNames",fileNames);

        return "detailedRequest";
    }
}