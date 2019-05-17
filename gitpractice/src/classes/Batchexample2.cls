global class Batchexample2 implements Database.Batchable<sObject>{
  global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('select id,name from account');
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope)
   {
   system.debug('Batchexampele2 execute2');  
   }
    

global void finish(Database.BatchableContext BC)
{
  system.debug('Batchexampele2 finish2');  

   }
}