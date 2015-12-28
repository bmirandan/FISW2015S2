package sec.treasurer

class Magazine {
    String name
    String link
    String Autor
    String keywords
    Date year

    static hasMany = [user:User]

    static belongsTo = [User]

    static constraints = {
    }


}
