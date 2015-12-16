package sec.treasurer

class User {
    String userName
    String firstName
    String lastName
    String description
    Role role
    String email
    String password
    String confirmPassword
    boolean enabled
    byte[] avatar
    String avatarType

    static transients = ["confirmPassword"]

    static hasMany = [documents: Document,
                      publicationss: Publications,
                      thesiss: Thesis,
                      invesigation_reas: sec.treasurer.Investigation_Area,
                      conventions:sec.treasurer.Convention,
                      user_notifications: sec.treasurer.User_Notification,
                      projects: sec.treasurer.Project]

    static belongsTo = Role
    static constraints = {
        userName (nullable:false, unique: true)
        firstName (nullalbe: false)
        lastName  (nullalbe: false)
        email(nullable: false)
        description ()
        avatar(nullable:true, maxSize: 16384 /* 16K */)
        avatarType(nullable:true)
        enabled(nullable: false)

    }

    String toString () {
        "$firstName $lastName"
    }



}