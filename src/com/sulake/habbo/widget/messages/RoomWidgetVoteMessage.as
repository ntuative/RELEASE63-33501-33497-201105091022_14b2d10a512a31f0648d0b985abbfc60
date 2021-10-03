package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_128:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1729:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_128);
         this.var_1729 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1729;
      }
   }
}
