package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_152:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_169:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1218:String;
      
      private var var_1389:Array;
      
      private var var_1188:Array;
      
      private var var_1687:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1218 = param2;
         this.var_1389 = param3;
         this.var_1188 = param4;
         if(this.var_1188 == null)
         {
            this.var_1188 = [];
         }
         this.var_1687 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1218;
      }
      
      public function get choices() : Array
      {
         return this.var_1389.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1188.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1687;
      }
   }
}
