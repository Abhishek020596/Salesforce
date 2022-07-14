public class ContactHandler {
    public static list<Account> count(list<Contact> newlist)
    {
        Set<id> countsetId=new Set<id>();
        if(newlist!=null){
            for(Contact c:newlist)
            {
                countsetId.add(c.accountId);
            }
        }
        list<Account>accounts=[select Id ,no_of_contacts__c,(select Id from Contacts)from Account where Id in :countsetId];
        return accounts;
    }

    //Inserting the record and updating the record
    public static void countContacts(List<Contact> newlist){
        list<Account> accounts=count(newlist);
        list<Contact> contactList=new List<Contact>();
        for(Account acc:accounts){
            acc.no_of_contacts__c=acc.Contacts.size();
            contactList.addAll(acc.contacts);
        }
        update accounts;
    }

    //Deleting the record
    public static void countDelete(List<Contact> newlist)
    {
        list<Account> accounts=count(newlist);
        List<Account> UpdateAccountList=new List<Account>();
        for(Account obj:accounts){
            obj.no_of_contacts__c=obj.Contacts.size();
            UpdateAccountList.add(obj);
        }
        UPDATE UpdateAccountList;
    }

    //Before insert we checking the record
    public static void countCheck(List<Contact> newlist){
        list<Account> accounts=count(newlist);
        list<Contact> contactList=new List<Contact>();
        for(Account acc:accounts){
            if( acc.no_of_contacts__c>=5){
                contactList.addAll(acc.contacts);
            }
        }
        delete contactList;
    }
}