package sec.treasurer

class User_Notification {
    static hasMany = [users: User]
    static belongsTo = [User]
    static constraints = {
    }
}
