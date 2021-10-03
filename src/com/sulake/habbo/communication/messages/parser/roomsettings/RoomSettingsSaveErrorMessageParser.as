package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2146:int = 1;
      
      public static const const_1984:int = 2;
      
      public static const const_2009:int = 3;
      
      public static const const_2095:int = 4;
      
      public static const const_1635:int = 5;
      
      public static const const_2099:int = 6;
      
      public static const const_1680:int = 7;
      
      public static const const_1710:int = 8;
      
      public static const const_2097:int = 9;
      
      public static const const_1817:int = 10;
      
      public static const const_1722:int = 11;
      
      public static const const_1748:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1656:int;
      
      private var var_1497:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1656 = param1.readInteger();
         this.var_1497 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1656;
      }
      
      public function get info() : String
      {
         return this.var_1497;
      }
   }
}
