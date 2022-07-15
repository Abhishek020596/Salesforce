trigger ContactHandlerTrigger on Contact(before insert,after insert,after delete,after update,after undelete) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUndelete || Trigger.isUpdate)
        {
            ContactHandler.countContacts(Trigger.new);
        }
        if(trigger.isDelete || Trigger.isUpdate)
        { 
            ContactHandler.countDelete(Trigger.old);
        }
    }
    if(trigger.isBefore){
        if(trigger.isInsert){
            ContactHandler.countCheck(Trigger.new);
        }
    }
}



