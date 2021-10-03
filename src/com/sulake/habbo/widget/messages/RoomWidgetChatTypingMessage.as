package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_793:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_612:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_793);
         this.var_612 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_612;
      }
   }
}
