package Database.Entities;



import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "REQUESTS", schema = "MAX", catalog = "")
public class RequestsEntity {
    private long requestId;
    //@Pattern(regexp ="^[0-9]{2}[ ][0-9]{2}[ ][0-9]{6}]" ,message ="Номер паспорта должен соответствовать виду xx-xx-xxxxxx")
    @Size(min = 6,max = 6,message = "Номер паспорта должен состоять из 6 символов")
    private String pasportNumber;
    @Size(min=4,max = 5,message = "Серия паспорта должна быть вида xxxx или xx xx")
    private String pasportSeria;
    private Date pasportDate=new Date(System.currentTimeMillis());
    @Size(min=10,max = 80,message = "Размер данного поля должен быть от 10 до 80 символов")
    private String pasportWhoLet;
    @Pattern(regexp = "^[0-9]{3}[-][0-9]{3}[-][0-9]{3}[-][0-9]{2}",message = "Номер снилс должен быть вида xxx-xxx-xxx-xx")
    private String snils;
    private String requestType;
    private UsersEntity usersEntity=new UsersEntity();
    private Timestamp creationDate;
    private String workStatus;
    private String worker;
    @Size(min = 1,max = 200,message = "Размер сообщения должен быть до 200 знаков")
    private String messageToCustomer;
    @Min(value = 1,message = "Сумма должна быть положительной")
    private long price;

    @Override
    public String toString() {
        return "ID:"+getRequestId()+"\nСерия:"+getPasportSeria()+"\nНомер"+getPasportNumber()+"\nДата выдачи:"+getPasportDate()+"\nКем выдан" +
                ""+getPasportWhoLet()+"\nСнилс"+getSnils()+"\nТип заявки" +
                ""+getRequestType()+"\nКем создана:"+usersEntity.getUsername()+"\nДата создания:"+creationDate+"\nСтатус выполнения:"+workStatus+"\nИсполнитель"+worker+"\nСообщение пользователю:"+messageToCustomer;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "REQUEST_ID", nullable = false, precision = 0)
    public long getRequestId() {
        return requestId;
    }

    public void setRequestId(long requestId) {
        this.requestId = requestId;
    }

    @Basic
    @Column(name = "PASPORT_NUMBER", nullable = false, length = 20)
    public String getPasportNumber() {
        return pasportNumber;
    }

    public void setPasportNumber(String pasportNumber) {
        this.pasportNumber = pasportNumber;
    }

    @Basic
    @Column(name = "PASPORT_SERIA", nullable = false, length = 20)
    public String getPasportSeria() {
        return pasportSeria;
    }

    public void setPasportSeria(String pasportSeria) {
        this.pasportSeria = pasportSeria;
    }

    @Basic
    @Column(name = "PASPORT_DATE", nullable = false)
    public Date getPasportDate() {
        return pasportDate;
    }

    public void setPasportDate(Date pasportDate) {
        this.pasportDate = pasportDate;
    }

    @Basic
    @Column(name = "PASPORT_WHO_LET", nullable = false, length = 80)
    public String getPasportWhoLet() {
        return pasportWhoLet;
    }

    public void setPasportWhoLet(String pasportWhoLet) {
        this.pasportWhoLet = pasportWhoLet;
    }

    @Basic
    @Column(name = "SNILS", nullable = false, length = 20)
    public String getSnils() {
        return snils;
    }

    public void setSnils(String snils) {
        this.snils = snils;
    }

    @Basic
    @Column(name = "REQUEST_TYPE", nullable = false, length = 43)
    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "USER_ID")
    public UsersEntity getUsersEntity() {
        return usersEntity;
    }

    public void setUsersEntity(UsersEntity usersEntity) {
        this.usersEntity = usersEntity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RequestsEntity that = (RequestsEntity) o;
        return requestId == that.requestId &&
                Objects.equals(pasportNumber, that.pasportNumber) &&
                Objects.equals(pasportSeria, that.pasportSeria) &&
                Objects.equals(pasportDate, that.pasportDate) &&
                Objects.equals(pasportWhoLet, that.pasportWhoLet) &&
                Objects.equals(snils, that.snils) &&
                Objects.equals(requestType, that.requestType)&&
                Objects.equals(usersEntity,that.usersEntity);
    }

    @Override
    public int hashCode() {

        return Objects.hash(requestId, pasportNumber, pasportSeria, pasportDate, pasportWhoLet, snils, requestType,usersEntity);
    }

    @Basic
    @Column(name = "CREATION_DATE",nullable = false)
    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    @Basic
    @Column(name = "WORK_STATUS", nullable = true, length = 40)
    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus;
    }

    @Basic
    @Column(name = "WORKER", nullable = true, length = 20)
    public String getWorker() {
        return worker;
    }

    public void setWorker(String worker) {
        this.worker = worker;
    }

    @Basic
    @Column(name = "MESSAGE_TO_CUSTOMER", nullable = true, length = 200)
    public String getMessageToCustomer() {
        return messageToCustomer;
    }

    public void setMessageToCustomer(String messageToCustomer) {
        this.messageToCustomer = messageToCustomer;
    }

    @Basic
    @Column(name = "PRICE", nullable = true, precision = 0)
    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }
}
