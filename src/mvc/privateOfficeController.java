package mvc;

import Database.DatabaseInterracts.RequestsTableInterract;
import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.RequestsEntity;
import Database.Entities.UsersEntity;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.*;
import java.nio.file.*;
import java.util.Base64;

import java.util.*;

@Controller
public class privateOfficeController {
    UserTableInterract userTableInterract;
    RequestsTableInterract requestsTableInterract;

    @Autowired
    privateOfficeController(UserTableInterract userTableInterract,RequestsTableInterract requestsTableInterract)
    {
        this.requestsTableInterract=requestsTableInterract;
        this.userTableInterract=userTableInterract;
    }

    @RequestMapping(value = "/privateOffice",method = RequestMethod.GET)
    String privateOfficeAccess(@RequestParam(value="username",required = true) String username, Model model)
    {

        UsersEntity usersEntity=userTableInterract.getUsersFromDbByUsername(username);

        if(usersEntity.getRole().equals("ROLE_DEFAULT_USER"))
        {
            //Получаем все заявки из БД
             List<RequestsEntity> list=requestsTableInterract.getRequestsByusername(username);

             HashMap<Long,String []> fileNameImages=new HashMap<>();

             showFilesOnPage2(list,fileNameImages,username);


             model.addAttribute("listRequests",list);
             model.addAttribute("mapFiles",fileNameImages);
             return "privateOfficePage";
        }
        else
            {    System.out.println("Мы тут");
                //Получаем все заявки из БД
                 List<RequestsEntity> list=requestsTableInterract.getWorkerRequestsByUsername(username);
                 HashMap<Long,String[]> fileNameImages=new HashMap<>();
                 showFilesOnPage2(list,fileNameImages,username);
                 model.addAttribute("listRequests",list);
                 model.addAttribute("mapFiles",fileNameImages);
                 return "privateOfficePage";
    }

    }

    void showFilesOnPage2(List<RequestsEntity> list,HashMap<Long,String []> hashMap,String username)
    {
        list.forEach(requestsEntity ->{
            ArrayList<String> imageNames=new ArrayList<>();
            File file=new File("C:\\BRGZ\\"+requestsEntity.getUsersEntity().getUsername()+"\\"+requestsEntity.getRequestId()+"\\");
            if(file.exists())
            {
                String [] fileNames=file.list();
                hashMap.put(requestsEntity.getRequestId(),fileNames);
            }

        } );

    }


    @RequestMapping(value = "/privateOfficeInfo",method = RequestMethod.GET)
    String privateOfficeInfo(@RequestParam(value="username") String username, Model model)
    {
        UsersEntity usersEntity=userTableInterract.getUsersFromDbByUsername(username);
        model.addAttribute("usersEntity",usersEntity);
        return "userInformation";
    }

    @RequestMapping(value ="/editUserInformation",method = RequestMethod.POST)
    String createNewUser(@RequestParam(value = "username")String username,Model model)
    {
        UsersEntity usersEntity=userTableInterract.getUsersFromDbByUsername(username);
        model.addAttribute("usersEntity",usersEntity);

        return "createNewUser";
    }

   @RequestMapping(value = "/privateOffice",method = RequestMethod.POST)
    String privateOfficePostHandler(Long id , Model model)
    {
        RequestsEntity requestsEntity=requestsTableInterract.getRequestsByRequestId(id);
        model.addAttribute("requestsEntity",requestsEntity);
        return "createNewRequestPage";
    }


   @RequestMapping("/getImage")
   @ResponseBody byte[] getImageFromFileName(@RequestParam(value = "imageName")String imageName,@RequestParam(value = "username") String username,@RequestParam(value = "requestId") Long id,Model model) throws IOException {


       File file=new File("C:\\BRGZ\\"+username+"\\"+id+"\\"+imageName);
       byte [] bytes=new byte[(int)file.length()];

       try {
           FileInputStream fileInputStream=new FileInputStream(file);
           fileInputStream.read(bytes);
           fileInputStream.close();

       } catch (FileNotFoundException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       }

     return bytes;
   }

    //
    @ResponseBody
    @RequestMapping(value = "/deleteImage")
    void deleteImageFromFileName(@RequestParam(value = "imageName")String imageName,@RequestParam(value = "username") String username,@RequestParam(value = "requestId") Long id)
    {
        System.out.println("Я пытаюсь удалить твой файл хозяин");
        try {
            Files.delete(Paths.get("C:\\BRGZ\\"+username+"\\"+id+"\\"+imageName));
        } catch (NoSuchFileException x) {
            System.err.format("%s: no such" + " file or directory%n", "C:\\BRGZ\\"+username+"\\"+id+"\\"+imageName);
        } catch (DirectoryNotEmptyException x) {
            System.err.format("%s not empty%n", "C:\\BRGZ\\"+username+"\\"+id+"\\"+imageName);
        } catch (IOException x) {
            // File permission problems are caught here.
            System.err.println(x);
        }

       // return "redirect:privateOffice?username="+username;
        return ;
    }

}
