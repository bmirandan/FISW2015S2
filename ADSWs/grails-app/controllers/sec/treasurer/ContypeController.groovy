package sec.treasurer
/**
 * Created by pc-1 on 12/11/2015.
 */
class ContypeController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ contypeInstanceList: Contype.list( params ), contypeInstanceTotal: Contype.count() ]
    }

    def show = {
        def contypeInstance = Contype.get( params.id )

        if(!contypeInstance) {
            flash.message = "sec.treasurer.Contype not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ contypeInstance : contypeInstance ] }
    }

    def delete = {
        def contypeInstance = Contype.get( params.id )
        if(contypeInstance) {
            try {
                contypeInstance.delete()
                flash.message = "sec.treasurer.Contype ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "sec.treasurer.Contype ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "sec.treasurer.Contype not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def contypeInstance = Contype.get( params.id )

        if(!contypeInstance) {
            flash.message = "sec.treasurer.Contype not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ contypeInstance : contypeInstance ]
        }
    }

    def update = {
        def contypeInstance = Contype.get( params.id )
        if(contypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(contypeInstance.version > version) {

                    contypeInstance.errors.rejectValue("version", "contype.optimistic.locking.failure", "Another user has updated this sec.treasurer.Contype while you were editing.")
                    render(view:'edit',model:[contypeInstance:contypeInstance])
                    return
                }
            }
            contypeInstance.properties = params
            if(!contypeInstance.hasErrors() && contypeInstance.save()) {
                flash.message = "sec.treasurer.Contype ${params.id} updated"
                redirect(action:show,id:contypeInstance.id)
            }
            else {
                render(view:'edit',model:[contypeInstance:contypeInstance])
            }
        }
        else {
            flash.message = "sec.treasurer.Contype not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def contypeInstance = new Contype()
        contypeInstance.properties = params
        return ['contypeInstance':contypeInstance]
    }

    def save = {
        def contypeInstance = new Contype(params)
        if(!contypeInstance.hasErrors() && contypeInstance.save()) {
            flash.message = "sec.treasurer.Contype ${contypeInstance.id} created"
            redirect(action:show,id:contypeInstance.id)
        }
        else {
            render(view:'create',model:[contypeInstance:contypeInstance])
        }
    }

    def upload_avatar = {
        def Contype = Contype.get( params.id )
//      def sec.treasurer.Contype = sec.treasurer.Contype.current(session)  // or however you select the current sec.treasurer.Contype

        // Get the avatar file from the multi-part request
        def f = request.getFile('avatar')

        // List of OK mime-types
        def okcontents = ['image/png', 'image/jpeg', 'image/gif', 'image/jpg']
        if (! okcontents.contains(f.getContentType())) {
            flash.message = "${f.getContentType()} Avatar must be one of: ${okcontents}"
            redirect(action:edit,id:params.id)
//      render(view:'select_avatar', model:[sec.treasurer.Contype:sec.treasurer.Contype])
            return;
        }

        // Save the image and mime type
        Contype.avatar = f.getBytes()
        Contype.avatarType = f.getContentType()
        //log.info("File uploaded: " + sec.treasurer.Contype.avatarType)

        // Validation works, will check if the image is too big
        if (!Contype.save()) {
            flash.message = "Avatar too large "


            redirect(action:edit,id:params.id)

//        render(view:'select_avatar', model:[sec.treasurer.Contype:sec.treasurer.Contype])
            return;
        }
        flash.message = "Avatar (${Contype.avatarType}, ${Contype.avatar.size()} bytes) uploaded."

        redirect(action:'show',id:params.id)
    }

    def avatar_image = {
        def avatarContype = Contype.get(params.id)
        if (!avatarContype || !avatarContype.avatar || !avatarContype.avatarType) {
            response.sendError(404)
            return;
        }
        response.setContentType(avatarContype.avatarType)
        response.setContentLength(avatarContype.avatar.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarContype.avatar);
        out.close();
    }

}