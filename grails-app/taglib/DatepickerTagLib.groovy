class DatepickerTagLib {

    static returnObjectForTags = ['hhmm']

    def date = {attrs ->
        attrs.type = "text"
        attrs.tagName = "date"
        attrs.maxlength = "9"
        attrs.size = attrs.size ?: 10
        attrs.id = attrs.id ?: g.uuid()

        def org_value = attrs.value
        if (attrs.value){ attrs.value = df(date:attrs.value,format:'YYY/MM/DD') }

        def uuid = attrs.id

        // create a field for javascript to morph
        out << field(attrs)
        out << """<script type="text/javascript">datepicker("${uuid}")</script>"""

        def hh, mm
        if (org_value && org_value instanceof Date) {
            hh = org_value.format("HH")
            mm = org_value.format("mm")
        }

        if (attrs.time == "true") {
            out << g.textField(name: uuid + "Hh", size: 3, maxlength: 2, value: hh) << "︰" << g.textField(name: uuid + "Mm", size: 3, maxlength: 2, value: mm)
        }
    }

    def date2 = {attrs ->
        attrs.type = "text"
        attrs.tagName = "date"
        attrs.maxlength = "6"
        attrs.id = attrs.id ?: g.uuid()

        def uuid = attrs.id

        if(!attrs.size){
            attrs.size = 10
        }

        def hiddenValue

        if(attrs.value){
            hiddenValue = df(date:attrs.value)
            attrs.value = df(date:attrs.value,format:'YYY/MM')
        }else {
            hiddenValue = df(date:new Date())
        }


        out << """<script type="text/javascript">datepicker2("${uuid}")</script>"""

        out << field(attrs) + g.hiddenField(name:("h_"+uuid),id:("h_"+uuid),value:hiddenValue,style:'display:block;')
    }


    def hhmm = {attrs ->
        def output = " "
        output += g.text(size:'3',maxlength:'2',name:attrs.name,id:(attrs.name+'Hh'),value:df(date:attrs?.value,format:'hh'))
        output += "："
        output += g.text(size:'3',maxlength:'2',name:attrs.name,id:(attrs.name+'Mm'),value:df(date:attrs?.value,format:'mm'))
        return output
    }

}

// vim: ts=4 sw=4 expandtab
