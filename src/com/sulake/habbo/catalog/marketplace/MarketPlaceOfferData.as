package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2284:int;
      
      private var var_2156:String;
      
      private var var_1721:int;
      
      private var var_2281:int;
      
      private var var_2283:int;
      
      private var var_408:int;
      
      private var var_2282:int = -1;
      
      private var var_1720:int;
      
      private var var_45:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2284 = param3;
         this.var_2156 = param4;
         this.var_1721 = param5;
         this.var_408 = param6;
         this.var_2281 = param7;
         this.var_1720 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_45)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2284;
      }
      
      public function get stuffData() : String
      {
         return this.var_2156;
      }
      
      public function get price() : int
      {
         return this.var_1721;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2281;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_45 != null)
         {
            this.var_45.dispose();
         }
         this.var_45 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2283 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2283;
      }
      
      public function get status() : int
      {
         return this.var_408;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2282;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1721 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1720;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1720 = param1;
      }
   }
}
