package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2914:int;
      
      private var var_2912:int;
      
      private var var_2913:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2914 = param1;
         this.var_2912 = param2;
         this.var_2913 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2914,this.var_2912,this.var_2913];
      }
      
      public function dispose() : void
      {
      }
   }
}
