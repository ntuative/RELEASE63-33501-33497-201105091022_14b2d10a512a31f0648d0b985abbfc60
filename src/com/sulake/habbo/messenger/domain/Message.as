package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_798:int = 1;
      
      public static const const_803:int = 2;
      
      public static const const_818:int = 3;
      
      public static const const_1302:int = 4;
      
      public static const const_938:int = 5;
      
      public static const const_1337:int = 6;
       
      
      private var _type:int;
      
      private var var_1326:int;
      
      private var var_2219:String;
      
      private var var_2455:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1326 = param2;
         this.var_2219 = param3;
         this.var_2455 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2219;
      }
      
      public function get time() : String
      {
         return this.var_2455;
      }
      
      public function get senderId() : int
      {
         return this.var_1326;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
