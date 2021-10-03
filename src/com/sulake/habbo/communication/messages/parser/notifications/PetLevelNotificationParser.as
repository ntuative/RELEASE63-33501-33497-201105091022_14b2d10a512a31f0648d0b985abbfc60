package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_2038:int;
      
      private var var_2428:String;
      
      private var var_1500:int;
      
      private var var_1280:int;
      
      private var var_1853:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2038 = param1.readInteger();
         this.var_2428 = param1.readString();
         this.var_1500 = param1.readInteger();
         this.var_1280 = param1.readInteger();
         this.var_1853 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_2038;
      }
      
      public function get petName() : String
      {
         return this.var_2428;
      }
      
      public function get level() : int
      {
         return this.var_1500;
      }
      
      public function get petType() : int
      {
         return this.var_1280;
      }
      
      public function get breed() : int
      {
         return this.var_1853;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
