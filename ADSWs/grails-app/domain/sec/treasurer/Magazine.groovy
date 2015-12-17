package sec.treasurer

class Magazine {
    String name
    String link
    String magazineN
    ArrayList<String> keywords = new ArrayList<String>()
    Date year

    static hasMany = [user:User]

    static belongsTo = [User]

    static constraints = {
    }


}
