package sec.treasurer
/**
 * Created by pc-1 on 12/11/2015.
 */
class Contact {
    String value
    Contype contype
    User owner

    static belongsTo=[Contype, User]

    String link (String x) {
        return "<a href='${x}'>${name}</a>"
    }

    String toString () {
        if (!contype.useIcon){
            return value
        }
        else {
            return link(contype.mask.gsub("_user_", value))
        }
    }

    static constraints = {
        value(nullable: false)
    }
}