public class ContactHandler {
    //
   public static void countContacts(List<Contact> newList){
       Set<Id> accountIdSet = new Set<Id>();
       //if(newList!= null){
           for(contact c: newList){
               if(c.accountId!= null){
                accountIdSet.add(c.accountId);
               }
           }

        List<Account> accounts = [SELECT Id, no_of_contacts__c,(select Id from Contacts) 
                                 FROM Account 
                                 WHERE Id in: accountIdSet];
        List<Contact> contactsList = new List<Contact>();

            for(Account acc : accounts){
                acc.no_of_contacts__c = acc.Contacts.size();
                {
                    contactsList.addAll(acc.Contacts);
                }
            }
        UPDATE accounts;
    }
}    