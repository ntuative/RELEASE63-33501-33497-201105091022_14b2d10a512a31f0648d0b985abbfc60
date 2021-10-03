package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1444:Boolean;
      
      private var var_2694:int;
      
      private var var_1959:int;
      
      private var var_1960:int;
      
      private var var_2695:int;
      
      private var var_2698:int;
      
      private var var_2693:int;
      
      private var var_2692:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1444;
      }
      
      public function get commission() : int
      {
         return this.var_2694;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1959;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1960;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2698;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2695;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2693;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2692;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1444 = param1.readBoolean();
         this.var_2694 = param1.readInteger();
         this.var_1959 = param1.readInteger();
         this.var_1960 = param1.readInteger();
         this.var_2698 = param1.readInteger();
         this.var_2695 = param1.readInteger();
         this.var_2693 = param1.readInteger();
         this.var_2692 = param1.readInteger();
         return true;
      }
   }
}
