public with sharing class FlowRecordVersionTriggerHandler {

    public static void handleDelete(List<FlowRecordVersion> triggerDotOld) {
        
        Flow_Deletion_Setting__c flowDeletionSetting =  Flow_Deletion_Setting__c.getOrgDefaults();
        if (!flowDeletionSetting.Allow_Deletion__c) {
            for (FlowRecordVersion frv : triggerDotOld) {
            frv.addError(Label.Flow_Deletion_Error);   
            }   
        }        
    }
}