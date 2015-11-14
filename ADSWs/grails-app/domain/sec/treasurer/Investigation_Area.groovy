package sec.treasurer

class Investigation_Area {
    static hasMany = [users: User]
    static belongsTo = [User]
    /*
       atributos por definir
*/
    static constraints = {
    }
}
