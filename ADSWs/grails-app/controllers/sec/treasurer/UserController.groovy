package sec.treasurer

class UserController {

    def mailService

    def beforeInterceptor = {
        def user = session.user
        if (user) {
            user.refresh( )
        }
    }

    def login = {

    }

    def checkUP (params) {
//    println(params.userName)
//    println(params.password)
        User user = User.findByUserNameAndPassword(params.userName, params.password)
        user
    }

    def loginSuccess = {
        def user = checkUP(params)
        def available
        if( !user) {
            available = false
        } else {
            available = true
        }
//        println(available)
        response.contentType = "application/json"
        render """{"available":${available}}"""

    }

    def editpassword = {}

    def savepassword = {
        def user = session.user
        if (!user) {
            flash.message = "sec.treasurer.User not found!"
            redirect (controller: 'user', action: 'login')
        }
        else {
            user.password=params.password
            user.save()
            session.user = user
            redirect (controller:'homepage', action:'home')
        }
    }

    def handleLogin = {
        def user = checkUP(params)
        if (!user) {
            flash.message = "User not found!"
            redirect (controller: 'user', action: 'login')
        }
       // System.out.println(Role.get((User.findByUserName(params.userName)).roleId).isAdmin)
        if(((User.findByUserName(params.userName)).role).isAdmin){
            session.user = user
            def usuario=User.findByUserName(params.userName)
            redirect(controller: 'homepage',action: 'dashboard',params: ['userName': usuario])
        }


        else {
            session.user = user
            redirect (controller:'homepage', action:'home')
        }
    }

    def logout = {
        if (session.user) {
            session.user = null
            redirect (uri: '/')
        }
    }


    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ userInstanceList: User.list( params ), userInstanceTotal: User.count() ]
    }

    def show = {
        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "sec.treasurer.User not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ userInstance : userInstance ] }
    }

    def upload_avatar = {
        def user = User.get( params.id )
//      def user = sec.treasurer.User.current(session)  // or however you select the current user

        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')

        // List of OK mime-types
        def okcontents = ['image/png', 'image/jpeg', 'image/gif', 'image/jpg']
        if (! okcontents.contains(f.getContentType())) {
            flash.message = "${f.getContentType()} Avatar must be one of: ${okcontents}"
            if (user.role.isAdmin == true) {
                redirect(action:edit,id:params.id)
            }
            else {
                redirect(action:editprofile)
            }
//      render(view:'select_avatar', model:[user:user])
            return;
        }

        // Save the image and mime type
        user.avatar = f.getBytes()
        user.avatarType = f.getContentType()
        //log.info("File uploaded: " + user.avatarType)

        // Validation works, will check if the image is too big
        if (!user.save()) {
            flash.message = "Avatar too large "

            if (user.role.isAdmin == true) {
                redirect(action:edit,id:params.id)
            }
            else {
                redirect(action:editprofile)
            }
//        render(view:'select_avatar', model:[user:user])
            return;
        }
        flash.message = "Avatar (${user.avatarType}, ${user.avatar.size()} bytes) uploaded."
        if (user.role.isAdmin == true) {
            redirect(action:'show',id:params.id)
        }

        else {
            redirect(controller: 'homepage', action: 'home')
        }

    }

    def avatar_image = {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.avatar || !avatarUser.avatarType) {
            response.sendError(404)
            return;
        }
        response.setContentType(avatarUser.avatarType)
        response.setContentLength(avatarUser.avatar.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.avatar);
        out.close();
    }


    def delete = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            try {
                userInstance.delete()
                flash.message = "sec.treasurer.User ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "sec.treasurer.User ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "sec.treasurer.User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def userInstance = User.get( params.id )

        if(!userInstance) {
            flash.message = "sec.treasurer.User not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ userInstance : userInstance ]
        }
    }

    def update = {
        def userInstance = User.get( params.id )
        if(userInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(userInstance.version > version) {

                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this sec.treasurer.User while you were editing.")
                    render(view:'edit',model:[userInstance:userInstance])
                    return
                }
            }
            userInstance.properties = params
            if(!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "sec.treasurer.User ${params.id} updated"
                redirect(action:show,id:userInstance.id)
            }
            else {
                render(view:'edit',model:[userInstance:userInstance])
            }
        }
        else {
            flash.message = "sec.treasurer.User not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def register = {
        def userInstance = new User()
        userInstance.properties = params
        return ['userInstance':userInstance]
    }

    def save = {
        def userInstance = new User(params)

        if(!userInstance.hasErrors() && userInstance.save()) {
            flash.message = "User ${userInstance.id} registered"
            redirect(action:show,id:userInstance.id)
        }
        else {
            render(view:'register',model:[userInstance:userInstance])
        }
    }

    def saveprofile = {
        def user = session.user;
        if (!user) {
            flash.message = "User not found!"
            redirect (controller: 'user', action: 'login')
        }
        else {
            user.enabled = false
            user.firstName=params.firstName
            user.lastName=params.lastName

            user.userName=params.userName
            user.area.id=5
            user.role.id=8
            user.save()
            redirect (controller:'homepage', action:'home')
        }
    }

    def editprofile = {

    }
    def profile = {
        def user = session.user
        def rol= user.role
       def Rolesg=  Role.getAll()


        def Areas =  Investigation_Area.getAll()
        [roles: Rolesg, areas: Areas]
    }

    def updateName={
        def usuario = session.user

        User.executeUpdate("update User U set U.firstName =:nombre " +
                "where U.id=:id",[nombre: params.userName,id: usuario.id])
        User.executeUpdate("update User U set U.lastName =:apellido " +
                "where U.id=:id",[apellido: params.userLast,id: usuario.id])
        redirect(controller: 'user',action: 'profile')
    }
    def updateArea ={
        def usuario= session.user
        int value = (Investigation_Area.findByName(params.harea)).id
        long cvalue = Long.valueOf(value)
        User.executeUpdate("update User U set U.area.id =:valu " +
                "where U.id=:id",
                [valu: cvalue  , id: usuario.id])

        redirect(controller: 'user',action: 'profile')


       /* INSERT INTO `sec_treasurer`.`user_invesigation_reas`
        (`investigation_area_id`, `user_id`) VALUES ('2', '4');
        */

    }
    def setMagazine={

//INSERT INTO `sec_treasurer`.`magazine`
// (`id`, `version`, `isbn`, `autores`, `editorial`, `link`, `name`,
// `revista`, `year`, `magazine_name`, `magazinen`)
// VALUES ('1', '0', 'd', 'dd', 'd', 'd', 'dd', 'dd', 'dd', 'dd', 'dd');


        /* name="harea" value="${areas.id}" >
        <input value="Nombre articulo" name = "Name" >
        <input value="Nombre revista" name = "magaName" >
        <input value="Autor1 Autor2" name = "autorNames" >
        */

    }

    def updateRol={
        def usuario = session.user

        int value = (Role.findByName(params.role)).id
                long cvalue = Long.valueOf(value)
        User.executeUpdate("update User U set U.role.id =:valu " +
                "where U.id=:id",
                [valu: cvalue  , id: usuario.id])

        redirect(controller: 'user',action: 'profile')
    }


    def setEnable(){
        User user=User.findByEmail(params.email)
        // se hace a la forma de grails una query
        // UPDATE `sec_treasurer`.`user` SET `enabled`=True WHERE `id`='4';
         User.executeUpdate("update User U set U.enabled=:valu " +
                "where U.id=:id",
                [valu: true, id: user.id])
        User.executeUpdate("update User U set U.userName=:valu " +
                "where U.id=:id",
                [valu: params.name, id: user.id])

        mailService.sendMail {
            to user.email
            from session.user.email

            subject "Bienvenido a labmmba " + user.firstName
            body "Se ha activado su cuenta de Labmmba, su nombre de usuario es: " + params.name +
                    "y su contraseña es: "+user.password+", con estos puede ingresar a la plataforma"
        }

        redirect(controller: 'homepage',action: 'dashboard')
    }




    def scaffold = User
}