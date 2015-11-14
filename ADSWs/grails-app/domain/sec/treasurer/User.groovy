package sec.treasurer

class User {
    String userName
    String firstName
    String lastName
    String description
    Role role
    String password
    String confirmPassword

    byte[] avatar
    String avatarType

    static transients = ["confirmPassword"]


    static hasMany =[contacts: Contact]

    static constraints = {
        userName (nullable:false, unique: true)
        firstName (nullalbe: false)
        lastName  (nullalbe: false)
        description ()
        avatar(nullable:true, maxSize: 16384 /* 16K */)
        avatarType(nullable:true)


    }

    String toString () {
        "$firstName $lastName"
    }
}