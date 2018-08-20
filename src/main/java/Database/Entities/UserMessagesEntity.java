package Database.Entities;

import javax.persistence.*;
import java.sql.Time;
import java.util.Objects;

@Entity
@Table(name = "USER_MESSAGES", schema = "C##MAX", catalog = "")
public class UserMessagesEntity {
    private long messageId;
    private String textMessage;
    private Time creationDate;
    private Time editDate;

    private UsersEntity usersEntity;

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
    public Time getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Time creationDate) {
        this.creationDate = creationDate;
    }

    @Basic
    @Column(name = "EDIT_DATE", nullable = true)
    public Time getEditDate() {
        return editDate;
    }

    public void setEditDate(Time editDate) {
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
}
