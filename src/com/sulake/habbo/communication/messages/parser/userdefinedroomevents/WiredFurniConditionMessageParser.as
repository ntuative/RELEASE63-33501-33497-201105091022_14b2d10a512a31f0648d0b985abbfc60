package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ConditionDefinition;
   
   public class WiredFurniConditionMessageParser implements IMessageParser
   {
       
      
      private var var_1676:ConditionDefinition;
      
      public function WiredFurniConditionMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1676 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1676 = new ConditionDefinition(param1);
         return true;
      }
      
      public function get def() : ConditionDefinition
      {
         return this.var_1676;
      }
   }
}
