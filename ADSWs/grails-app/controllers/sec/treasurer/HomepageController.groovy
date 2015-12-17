package sec.treasurer

import grails.transaction.Transactional

/**
 * Created by pc-1 on 12/11/2015.
 */
class HomepageController {

    def beforeInterceptor = {
        def user = session.user
        if ((user.enabled != false) && user) {
            user.refresh( )
        }
        else {
            flash.message = "Usuario no autorizado!"
            redirect (controller: 'user', action: 'login')

        }
    }

    def index = { }
    def home = { }
    def dashboard={
        def user = session.user
        if(user.role.isAdmin != true){

            redirect(controller: 'homepage',action: 'home')
        }

       List<User> unableUsers = User.findAllByEnabled(false)

        [userList:unableUsers]
    }

/*
    @Transactional
    def activateUser() {
        if (grailsApplication.config.userType != "Admin") {
            redirect(uri: "/admin")
        }
        User user = User.findById(params.id)
        user.activated = 1
        user.save flush:true
        flash.message = "Cuenta del usuario "+user.email+" activada con exito."
        redirect(uri:"/admin/user_list")
    }*/

    def setEnable(String userName){

        User user=User.findByUserName(userName)
        // se hace a la forma de grails una query
        // UPDATE `sec_treasurer`.`user` SET `enabled`=True WHERE `id`='4';
        User.executeUpdate("update User U set U.enabled=:valu " +
                "where U.id=:id",
                [valu: true, id: user.id])

       redirect(controller: 'homepage',action: 'dashboard')
    }


}