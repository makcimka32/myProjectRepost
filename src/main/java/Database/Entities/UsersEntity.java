package Database.Entities;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Objects;

@Entity
@Table(name = "USERS", schema = "MAX", catalog = "")
public class UsersEntity {
    private long userId;
    @Size(min=3,max=20,message = "Имя должно состоять из 3-20 символов")
    private String firstName;
    @Size(min=3,max=20,message = "Фамилия должна состоять из 3-20 символов")
    private String secondName;
    @Pattern(regexp = "^[0-9][-][0-9]{3}[-][0-9]{3}[-][0-9]{2}[-][0-9]{2}",message = "Номер телефона должен быть следующего вида: 8-920-888-88-88")
    private String phoneNumber;
    @Size(min=3,max=20,message = "Логин должен состоять из 3-20 символов")
    @Pattern(regexp="^[a-zA-Z0-9]+$",    message="Логин должен состоять из букв Английского алфавита без пробелов")
    private String username;
    @Size(min=6,max=20,message = "Пароль должен состоять из 6-20 символов")
    private String password;
    @Pattern(regexp = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}",message ="Почта должна быть вида xxxx@xxx.ru/com/net и т.д")
    private String email;
    private boolean emailNewsletter;
    private boolean enabled;
    private String role;



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID", nullable = false, precision = 0)
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "FIRST_NAME", nullable = false, length = 30)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "SECOND_NAME", nullable = false, length = 30)
    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    @Basic
    @Column(name = "PHONE_NUMBER", nullable = false, length = 20)
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "USERNAME", nullable = false, length = 20)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "PASSWORD", nullable = false, length = 20)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "EMAIL", nullable = false, length = 40)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "EMAIL_NEWSLETTER", nullable = false, precision = 0)
    public boolean isEmailNewsletter() {
        return emailNewsletter;
    }

    public void setEmailNewsletter(boolean emailNewsletter) {
        this.emailNewsletter = emailNewsletter;
    }

    @Basic
    @Column(name = "ENABLED", nullable = false, precision = 0)
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Basic
    @Column(name = "ROLE", nullable = false, length = 20)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UsersEntity that = (UsersEntity) o;
        return userId == that.userId &&
                emailNewsletter == that.emailNewsletter &&
                enabled == that.enabled &&
                Objects.equals(firstName, that.firstName) &&
                Objects.equals(secondName, that.secondName) &&
                Objects.equals(phoneNumber, that.phoneNumber) &&
                Objects.equals(username, that.username) &&
                Objects.equals(password, that.password) &&
                Objects.equals(email, that.email) &&
                Objects.equals(role, that.role);
    }

    @Override
    public int hashCode() {

        return Objects.hash(userId, firstName, secondName, phoneNumber, username, password, email, emailNewsletter, enabled, role);
    }
}
