package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1769:int;
      
      private var var_2349:String;
      
      private var var_933:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1769 = param1.readInteger();
         this.var_2349 = param1.readString();
         this.var_933 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1769;
      }
      
      public function get figureString() : String
      {
         return this.var_2349;
      }
      
      public function get gender() : String
      {
         return this.var_933;
      }
   }
}
