package sec.treasurer

class Convention {
    static hasMany = [users: User]
    static belongsTo = [User]
    /*
       atributos por definir
*/
    static constraints = {
    }
}
