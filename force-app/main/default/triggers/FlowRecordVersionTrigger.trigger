trigger FlowRecordVersionTrigger on FlowRecordVersion (before delete) {
    
    if(Trigger.isBefore && Trigger.isDelete){
        FlowRecordVersionTriggerHandler.handleDelete(Trigger.old);
    }
    
}