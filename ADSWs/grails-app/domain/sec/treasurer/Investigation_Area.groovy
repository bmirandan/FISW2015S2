package sec.treasurer

class Investigation_Area {

    String name

       /*

*/
    static constraints = {

    name {nullable: true}
        }

    @Override
    String toString() {
        name
    }
}
