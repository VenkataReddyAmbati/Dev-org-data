global class Batchexample implements Database.Batchable<sObject>{

 
   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('select id,name from account');
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope)
   {
   //Account acco = new Account();
	//	acco.name = 'batchexample123';
	//	Insert acco; 
    //   Queueablexample ar=new Queueablexample();
      // ID jobID = System.enqueueJob(ar);
      //Futureexample.testusecases();
      //System.schedule('TestSchedulerClass Job1', '0 0 * * * ?', new SchedulerClass());
}
    

global void finish(Database.BatchableContext BC)
{
  system.debug('example1 finish1'); 
    //Batchexample2 b2=new Batchexample2();
    //id batchinstanceid = database.executeBatch(b2);
     // Queueablexample2 ar=new Queueablexample2();
      // ID jobID = System.enqueueJob(ar);
       //Futureexample.testusecases();
       //System.schedule('TestSchedulerClass Job1', '0 0 * * * ?', new SchedulerClass2());
 }
}