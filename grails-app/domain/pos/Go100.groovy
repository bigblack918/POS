package pos

//產品名稱
class Go100 implements Serializable {
    static mapping = {
        table 'GO100'
        version false
        id column:'objid',generator:'assigned'
    }
    
    String name          //產品名稱
    String priceNum      //產品代號
    Date dateCreated     //新增日期
    Date lastUpdated     //更新日期
    
    static constraints = {
        name(nullable:false)
        priceNum(nullable:true)
        dateCreated(nullable:false)
        lastUpdated(nullable:true)
    }
    
}
