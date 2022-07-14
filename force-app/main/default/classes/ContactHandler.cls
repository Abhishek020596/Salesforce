public class ContactHandler {
    public static void countContacts(List<Contact> newList) {
        Set<Id> accountIds = new Set<Id>();
        if(newList!= null){
            for(Contact c: newList){
                accountIds.add(c.accountId);
            }
        }
        List<Account> accounts = [SELECT Id,Name, no_of_contacts__c,(select Id from Contacts) FROM Account WHERE Id in: accountIds];
        List<Account> contactsList = new List<Account>();
            for(Account acc : accounts){
                acc.no_of_contacts__c = acc.Contacts.size();
                contactsList.add(acc);
            }
        UPDATE contactsList;
    }
    public static void contactDelete(List<Contact> newList){
        Set<id> accountIds = new Set<id>();
        if(newList!= null){
           for(contact c: newList){
               if(c.accountId!= null){
                   accountIds.add(c.accountId);
               }
           }
       }
        List<Account> accounts = [select Id, no_of_contacts__c, (select Id from Contacts) from Account where Id in: accountIds];
        List<Contact> deleteContactsList = new List<Contact>();
            for(Account acc : accounts){
                if(acc.Contacts.size() == 5){
                    deleteContactsList.addAll(acc.Contacts);
                    acc.no_of_contacts__c=0;
                }
            }
        DELETE deleteContactsList;
    }
}







