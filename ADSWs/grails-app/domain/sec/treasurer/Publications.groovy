package sec.treasurer

class Publications {

    String name
    String link
    String autores
    String revista
    String keywords
    String ISBN
    Date year
    String editorial

    static belongsTo = [User]
    static constraints = {
    }
}
