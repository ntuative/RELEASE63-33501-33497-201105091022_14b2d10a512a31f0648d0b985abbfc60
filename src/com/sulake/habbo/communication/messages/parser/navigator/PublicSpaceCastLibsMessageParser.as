package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_1896:int;
      
      private var var_2198:String;
      
      private var var_2199:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1896 = param1.readInteger();
         this.var_2198 = param1.readString();
         this.var_2199 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return this.var_1896;
      }
      
      public function get castLibs() : String
      {
         return this.var_2198;
      }
      
      public function get unitPort() : int
      {
         return this.var_2199;
      }
   }
}
