public class ContactHandlerDelete {
    
   public static void countDelete(List<Contact> newList){
       Set<Id> accountIdSet = new Set<Id>();
       if(newList!= null){
           for(contact c: newList){
            system.debug('list of contact '+newList);
                accountIdSet.add(c.accountId);
           }
        }

        List<Account> accounts = [SELECT Id,Name, no_of_contacts__c,(select Id from Contacts) 
                                 FROM Account 
                                 WHERE Id in: accountIdSet];
        List<Account> contactsList = new List<Account>();

            for(Account acc : accounts){
                acc.no_of_contacts__c = acc.Contacts.size();
                contactsList.add(acc);
            }
        UPDATE contactsList;
    }
}