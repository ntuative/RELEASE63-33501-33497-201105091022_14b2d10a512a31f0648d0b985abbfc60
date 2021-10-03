package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2281:int;
      
      private var var_2352:int;
      
      private var var_2353:int;
      
      private var _dayOffsets:Array;
      
      private var var_1757:Array;
      
      private var var_1758:Array;
      
      private var var_2351:int;
      
      private var var_2350:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2281;
      }
      
      public function get offerCount() : int
      {
         return this.var_2352;
      }
      
      public function get historyLength() : int
      {
         return this.var_2353;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1757;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1758;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2351;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2350;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2281 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2352 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2353 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1757 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1758 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2351 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2350 = param1;
      }
   }
}
