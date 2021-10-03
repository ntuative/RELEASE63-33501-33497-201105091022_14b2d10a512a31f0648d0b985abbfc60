package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_193:int = 0;
      
      private var var_2039:int = 0;
      
      private var var_1653:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_193;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2039;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1653;
      }
      
      public function flush() : Boolean
      {
         this.var_193 = 0;
         this.var_2039 = 0;
         this.var_1653 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_193 = param1.readInteger();
         this.var_2039 = param1.readInteger();
         this.var_1653 = param1.readString();
         return true;
      }
   }
}
