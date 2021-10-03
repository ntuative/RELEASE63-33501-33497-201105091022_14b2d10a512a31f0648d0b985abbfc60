package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1656:int;
      
      private var var_1832:int;
      
      private var var_1831:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1832 = param1.readInteger();
         this.var_1656 = param1.readInteger();
         this.var_1831 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1656 = 0;
         this.var_1832 = 0;
         this.var_1831 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1656;
      }
      
      public function get messageId() : int
      {
         return this.var_1832;
      }
      
      public function get timestamp() : String
      {
         return this.var_1831;
      }
   }
}
