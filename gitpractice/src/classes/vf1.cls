public class vf1 {
    public list<account> acc{set;get;}
    public vf1(){
        acc=[select id,name from account];
        system.debug(acc[0].name);
    }

}