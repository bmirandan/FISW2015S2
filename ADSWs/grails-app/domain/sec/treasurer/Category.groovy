package sec.treasurer

class Category {
    static hasMany = [documents: Document]
    /*
           atributos por definir
   */

    String name
    static constraints = {
    }
}
