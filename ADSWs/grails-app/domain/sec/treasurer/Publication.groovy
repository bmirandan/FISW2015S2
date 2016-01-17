package sec.treasurer

class Publication {

    String name
    String link
    String autores
    String revista
    String keywords
    String ISBN
    Date year= new Date()
    String editorial

    //String filename
    //String fullPath
    //Date uploadDate = new Date()

    static constraints = {
        name(blank:false,nullable:false)
        link(blank:false,nullable:false)
    }
    static hasMany = [user:User]
    static belongsTo = [User]

}
