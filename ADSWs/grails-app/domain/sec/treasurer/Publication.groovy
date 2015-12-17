package sec.treasurer

class Publication {

    String name
    String link
    String autores
    String revista
    String keywords
    String ISBN
    Date year
    String editorial
    static hasMany = [user:User]
    static belongsTo = [User]
    static constraints = {
    }
}
