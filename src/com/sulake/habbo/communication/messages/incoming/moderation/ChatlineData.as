package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2534:int;
      
      private var var_2533:int;
      
      private var var_2535:int;
      
      private var var_2532:String;
      
      private var var_1694:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2534 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_2535 = param1.readInteger();
         this.var_2532 = param1.readString();
         this.var_1694 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2534;
      }
      
      public function get minute() : int
      {
         return this.var_2533;
      }
      
      public function get chatterId() : int
      {
         return this.var_2535;
      }
      
      public function get chatterName() : String
      {
         return this.var_2532;
      }
      
      public function get msg() : String
      {
         return this.var_1694;
      }
   }
}
