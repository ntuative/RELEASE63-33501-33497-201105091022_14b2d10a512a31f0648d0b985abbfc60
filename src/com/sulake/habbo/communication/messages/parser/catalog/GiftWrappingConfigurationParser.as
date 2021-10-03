package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2802:Boolean;
      
      private var var_2801:int;
      
      private var var_1929:Array;
      
      private var var_815:Array;
      
      private var var_816:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2802;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2801;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1929;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_815;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_816;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1929 = [];
         this.var_815 = [];
         this.var_816 = [];
         this.var_2802 = param1.readBoolean();
         this.var_2801 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1929.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_815.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_816.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
