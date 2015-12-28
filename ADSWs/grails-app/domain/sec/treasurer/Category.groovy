package sec.treasurer

class Category {

    /*
           atributos por definir
   */

    String name

    static hasMany = [document:Document]

    static belongsTo = [Document]
    
    static constraints = {
    }
}
