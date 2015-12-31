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
    Investigation_Area area
    ArrayList<String> preGrade = new ArrayList<String>()
    ArrayList<String> postGrade = new ArrayList<String>()


    static transients = ["confirmPassword"]

    static hasMany = [documents: Document,
                      publications: Publication,
                      thesiss: Thesis,
                      conventions:Convention,
                      user_notifications: Notification,
                      projects: Project,
                      magazines: Magazine

                ]

    static belongsTo = [Role, Investigation_Area]
    static constraints = {
        userName (nullable: true, unique: true)
        firstName (nullalbe: false)
        lastName  (nullalbe: false)
        email(nullable: false)
        description (nullable: true)
        avatar(nullable:true, maxSize: 56384 /* 16K */)
        avatarType(nullable:true)
        enabled(nullable: false)
        area{nullable: true}

    }

    String toString () {
        "$firstName $lastName"
    }



}