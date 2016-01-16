class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }



        "/register"(controller:"/user/register")

        "/login"(controller:"/user/login")

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
