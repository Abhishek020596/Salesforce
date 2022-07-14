trigger ContactHandlerTrigger on Contact (after insert, after update, after delete) {
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            ContactHandler.countContacts(Trigger.new);
        }
    if(trigger.isBefore){
        if (trigger.isDelete) {
            ContactHandler.contactDelete(Trigger.old);
        }
    }
    }
}