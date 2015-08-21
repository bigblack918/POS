package pos

class Go100Controller {

    def index() { 
        render(view:"index")    
    }
    
    def query() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.offset = params.offset?params.offset:0
        def go100InstanceList = [[Id:1,name:"Leo"],[Id:2,name:"Leo2"]] 
        //def go100InstanceList = Go100.createCriteria().list(params) {
//            eq("ptype","DRAWFARMCODE")
//            like("pcode",params.drawcompcode+'%')
        //}
        //render(template:"/queryResult")
        render(template:'queryResult',model:["go100InstanceList":go100InstanceList])
    }
    
}
