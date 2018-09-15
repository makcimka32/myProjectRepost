package Database.Entities;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "USER_MESSAGES", schema = "C##MAX")
public class UserMessagesEntity {
    private long messageId;
    @Size(min = 1,max=4000,message = "Сообщение должно состоять от 1 до 4000 символов ")
    private String textMessage;
    private Timestamp creationDate;
    private Timestamp editDate;

    private UsersEntity usersEntity;
    @Size(min=1,max=200,message = "Заголовок должен состоять от 1 до 200 символов")
    private String titleMessage;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MESSAGE_ID", nullable = false, precision = 0)
    public long getMessageId() {
        return messageId;
    }

    public void setMessageId(long messageId) {
        this.messageId = messageId;
    }

    @Basic
    @Column(name = "TEXT_MESSAGE", nullable = false, length = 2000)
    public String getTextMessage() {
        return textMessage;
    }

    public void setTextMessage(String textMessage) {
        this.textMessage = textMessage;
    }

    @Basic
    @Column(name = "CREATION_DATE", nullable = false)
    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    @Basic
    @Column(name = "EDIT_DATE", nullable = true)
    public Timestamp getEditDate() {
        return editDate;
    }

    public void setEditDate(Timestamp editDate) {
        this.editDate = editDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserMessagesEntity that = (UserMessagesEntity) o;
        return messageId == that.messageId &&
                Objects.equals(textMessage, that.textMessage) &&
                Objects.equals(creationDate, that.creationDate) &&
                Objects.equals(editDate, that.editDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(messageId, textMessage, creationDate, editDate);
    }

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "USER_ID")
    public UsersEntity getUsersEntity() {
        return usersEntity;
    }

    public void setUsersEntity(UsersEntity usersEntity) {
        this.usersEntity = usersEntity;
    }

    @Basic
    @Column(name = "TITLE_MESSAGE", nullable = false, length = 100)
    public String getTitleMessage() {
        return titleMessage;
    }

    public void setTitleMessage(String titleMessage) {
        this.titleMessage = titleMessage;
    }
}
