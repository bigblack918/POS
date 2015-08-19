package pos

class Go100Controller {

    def index() { 
        render(view:"index")    
    }
    
    def query() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.offset = params.offset?params.offset:0

        //def go100InstanceList = Go100.createCriteria().list(params) {
//            eq("ptype","DRAWFARMCODE")
//            like("pcode",params.drawcompcode+'%')
        //}
        //render(template:"/queryResult")
        render "AAAAAAAAAAAAAAA"
    }
    
}
