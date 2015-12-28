import sec.treasurer.Role
import sec.treasurer.Investigation_Area
import sec.treasurer.User

class BootStrap {

    def init = { servletContext ->
        new Role(name:'Admin', isAdmin:true).save()
        new Role(name: 'Estudiante de Pregrado',isAdmin: false).save()
        new Role(name: 'Estudiante de Postgrado',isAdmin: false).save()
        new Role(name: 'Trabajador',isAdmin: false).save()
        new Role(name: 'Jefe de laboratorio',isAdmin: false).save()
        new Role(name: 'Colaborador',isAdmin: false).save()
        new Role(name: 'Otro',isAdmin: false).save()
        new Investigation_Area(name: 'Biotecnología vegetal').save()
        new Investigation_Area(name: 'Compuestos bioactivos').save()
        new Investigation_Area(name: 'Microbiología').save()
        new Investigation_Area(name: 'Biotecnología ambiental').save()

    }
    def destroy = {
    }
}
