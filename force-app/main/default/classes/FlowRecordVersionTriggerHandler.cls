public with sharing class FlowRecordVersionTriggerHandler {

    public static void handleDelete(List<FlowRecordVersion> triggerDotOld) {
        
        
            for (FlowRecordVersion frv : triggerDotOld) {
            frv.addError(Label.Flow_Deletion_Error);    
        }
        
        
    }
}