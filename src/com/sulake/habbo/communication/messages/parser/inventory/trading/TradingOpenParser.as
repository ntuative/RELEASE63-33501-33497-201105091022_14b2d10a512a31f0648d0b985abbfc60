package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_1763:Boolean;
      
      private var var_1764:int;
      
      private var var_1765:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return this.var_1763;
      }
      
      public function get otherUserID() : int
      {
         return this.var_1764;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this.var_1765;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_1763 = false;
         this.var_1764 = -1;
         this.var_1765 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_1763 = param1.readInteger() == 1;
         this.var_1764 = param1.readInteger();
         this.var_1765 = param1.readInteger() == 1;
         return true;
      }
   }
}
