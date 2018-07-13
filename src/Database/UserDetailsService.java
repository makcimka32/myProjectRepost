package Database;

import Database.DatabaseInterracts.UserTableInterract;
import Database.Entities.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    private UserTableInterract userTableInterract;


    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {

        UsersEntity usersEntity=userTableInterract.getUsersFromDbByUsername(s);
        List<GrantedAuthority> authorities=new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(usersEntity.getRole()));
        return new User(usersEntity.getUsername(),usersEntity.getPassword(),usersEntity.isEnabled(),true,true,true,authorities);
    }

public  UserTableInterract getUserTableInterract()
{
    return this.userTableInterract;
}
public void setUserTableInterract(UserTableInterract userTableInterract) {
        this.userTableInterract = userTableInterract;
    }
}
