package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2284:int;
      
      private var var_2156:String;
      
      private var var_1721:int;
      
      private var var_408:int;
      
      private var var_2282:int = -1;
      
      private var var_2281:int;
      
      private var var_1720:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2284 = param3;
         this.var_2156 = param4;
         this.var_1721 = param5;
         this.var_408 = param6;
         this.var_2282 = param7;
         this.var_2281 = param8;
         this.var_1720 = param9;
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
      
      public function get status() : int
      {
         return this.var_408;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2282;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2281;
      }
      
      public function get offerCount() : int
      {
         return this.var_1720;
      }
   }
}
