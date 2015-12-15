package sec.treasurer
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

    }
}