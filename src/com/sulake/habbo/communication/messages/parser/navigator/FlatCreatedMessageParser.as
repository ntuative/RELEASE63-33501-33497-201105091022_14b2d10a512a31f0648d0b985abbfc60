package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_350:int;
      
      private var var_1827:String;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_350 = param1.readInteger();
         this.var_1827 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_350 + ", " + this.var_1827);
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_350;
      }
      
      public function get flatName() : String
      {
         return this.var_1827;
      }
   }
}
