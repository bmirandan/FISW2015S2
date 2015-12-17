package sec.treasurer

class Notification {

    String Content
    String Sender


    static hasMany = [users: User]

    static belongsTo = [User]
    static constraints = {
    }
}
