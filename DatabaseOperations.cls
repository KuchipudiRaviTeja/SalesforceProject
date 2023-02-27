public class DatabaseOperations {
    public static void DBOps(){
        //Insert a Customer Record First using simple DML Statement
        Customer__c customer = new Customer__c ();
        customer.Name  = 'Wipro';
        customer.Customer_Type__c  = 'Premium';
        insert customer;
        
        Billing__c billing = new Billing__c ();
        billing.Status__c = 'Paid';
        billing.Amount_Paid__c = 5000000;
        billing.Customer__c = customer.Id;
        
        List<Billing__c> billings = new List<Billing__c>();
        billings.add(billing);
        
        //Insert Billing record using Database methods.
        Database.SaveResult[ ] srList  = Database.insert(billings,false) ;
        
        for(Database.SaveResult sr : srList ){
            if(sr.isSuccess())
                System.debug(sr);
            else{
                Database.Error[ ] err = sr.getErrors();
                for(Database.Error e: err){
                    System.debug(e.getMessage());
                    System.debug(e.getStatusCode());
                    System.debug(e.getFields());

                }
            }
        }
    }
}