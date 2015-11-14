package sec.treasurer
/**
 * Created by pc-1 on 12/11/2015.
 */
class Contype {
    String name
    boolean useMask
    String mask
    String description

    byte[] avatar
    String avatarType

    static constraints = {
        name (nullable: false, unique: true)
        avatar(nullable:true, maxSize: 16384 /* 16K */)
        avatarType(nullable:true)
    }

    String toString () {
        return name
    }
}