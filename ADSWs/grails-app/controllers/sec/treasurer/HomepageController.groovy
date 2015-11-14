package sec.treasurer
/**
 * Created by pc-1 on 12/11/2015.
 */
class HomepageController {

    def beforeInterceptor = {
        def user = session.user
        if (user) {
            user.refresh( )
        }
    }

    def index = { }
    def home = { }
}