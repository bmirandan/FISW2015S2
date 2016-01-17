package sec.treasurer

class PublicationController {

    def index() { }

    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            flash.message = "File cannot be empty"
        } else {
            def Publication publicationInstance = new Publication()
            publicationInstance.name = file.originalFilename
            publicationInstance.link = grailsApplication.config.uploadFolder + publicationInstance.name
            file.transferTo(new File(publicationInstance.link))
            publicationInstance.save()
        }
        redirect (controller: 'homepage', action:'home')
    }
    def list(){
        params.max = 10
        [publicationInstanceList: Publication.list(params), publicationInstanceTotal: Publication.count()]

    }

}
