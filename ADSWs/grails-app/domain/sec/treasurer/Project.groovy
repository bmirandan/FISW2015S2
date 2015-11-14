package sec.treasurer

class Project {
    static hasMany = [users: User]
    static belongsTo = [User]
    /*
        atributos por definir
*/    static constraints = {
    }
}
