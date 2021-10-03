package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1795:int;
      
      private var var_2407:int;
      
      private var var_1447:int;
      
      private var var_2408:int;
      
      private var var_113:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1795 = param1.readInteger();
         this.var_2407 = param1.readInteger();
         this.var_1447 = param1.readInteger();
         this.var_2408 = param1.readInteger();
         this.var_113 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1795);
      }
      
      public function get callId() : int
      {
         return this.var_1795;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2407;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1447;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2408;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_113;
      }
   }
}
