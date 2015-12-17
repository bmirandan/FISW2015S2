package sec.treasurer

class Document {
    String filename
    String fullPath
    String link
    Date uploadDate = new Date()

    static belongsTo = [User, Category]
    String titulo /*y otros metodos*/
    /*
           atributos por definir
   */
    static constraints = {
        filename(blank: false, nullable: false)
        fullPath(blank: false, nullable: false)
    }
}
