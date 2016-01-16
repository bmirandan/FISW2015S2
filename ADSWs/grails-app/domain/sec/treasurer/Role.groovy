package sec.treasurer
/**
 * Created by pc-1 on 12/11/2015.
 */
class Role {
    String name
    boolean isAdmin

    static constraints = {
        name (nullable: false, unique: true)
    }

    String toString () {
        name
    }
}