public with sharing class FlowRecordVersionTriggerHandler {

    public static void handleDelete(List<FlowRecordVersion> triggerDotOld) {
        Flow_Deletion_Setting__mdt flowDeletionSetting = Flow_Deletion_Setting__mdt.getInstance('Flow_Deletion_Setting');
        if(flowDeletionSetting.Allow_Deletion__c == false){
            for (FlowRecordVersion frv : triggerDotOld) {
            frv.addError(Label.Flow_Deletion_Error);    
        }
        }
        
    }
}