package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1693:Boolean;
      
      private var var_903:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1693 = param1.readBoolean();
         this.var_903 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1693 + ", " + this.var_903.id + ", " + this.var_903.name + ", " + this.var_903.type + ", " + this.var_903.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1693;
      }
      
      public function get pet() : PetData
      {
         return this.var_903;
      }
   }
}
