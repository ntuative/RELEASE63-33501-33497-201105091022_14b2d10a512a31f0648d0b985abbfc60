package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1955:int;
      
      private var _currentPosition:int;
      
      private var var_1956:int;
      
      private var var_1954:int;
      
      private var var_1957:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1955;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1956;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1954;
      }
      
      public function get syncCount() : int
      {
         return this.var_1957;
      }
      
      public function flush() : Boolean
      {
         this.var_1955 = -1;
         this._currentPosition = -1;
         this.var_1956 = -1;
         this.var_1954 = -1;
         this.var_1957 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1955 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1956 = param1.readInteger();
         this.var_1954 = param1.readInteger();
         this.var_1957 = param1.readInteger();
         return true;
      }
   }
}
