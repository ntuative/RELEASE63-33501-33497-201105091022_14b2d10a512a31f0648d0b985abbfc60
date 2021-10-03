package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_152:String = "RSPE_VOTE_QUESTION";
      
      public static const const_169:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1218:String = "";
      
      private var var_1389:Array;
      
      private var var_1188:Array;
      
      private var var_1687:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1389 = [];
         this.var_1188 = [];
         super(param1,param2,param7,param8);
         this.var_1218 = param3;
         this.var_1389 = param4;
         this.var_1188 = param5;
         if(this.var_1188 == null)
         {
            this.var_1188 = [];
         }
         this.var_1687 = param6;
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
