package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1693:String = "pricing_model_unknown";
      
      public static const const_399:String = "pricing_model_single";
      
      public static const const_447:String = "pricing_model_multi";
      
      public static const const_516:String = "pricing_model_bundle";
      
      public static const const_1728:String = "price_type_none";
      
      public static const const_872:String = "price_type_credits";
      
      public static const const_1235:String = "price_type_activitypoints";
      
      public static const const_1118:String = "price_type_credits_and_activitypoints";
       
      
      private var var_728:String;
      
      private var var_1127:String;
      
      private var _offerId:int;
      
      private var var_1719:String;
      
      private var var_1129:int;
      
      private var var_1128:int;
      
      private var var_1718:int;
      
      private var var_364:ICatalogPage;
      
      private var var_605:IProductContainer;
      
      private var var_2279:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1719 = param2;
         this.var_1129 = param3;
         this.var_1128 = param4;
         this.var_1718 = param5;
         this.var_364 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_364;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1719;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1129;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1128;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1718;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_605;
      }
      
      public function get pricingModel() : String
      {
         return this.var_728;
      }
      
      public function get priceType() : String
      {
         return this.var_1127;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2279;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2279 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1719 = "";
         this.var_1129 = 0;
         this.var_1128 = 0;
         this.var_1718 = 0;
         this.var_364 = null;
         if(this.var_605 != null)
         {
            this.var_605.dispose();
            this.var_605 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_728)
         {
            case const_399:
               this.var_605 = new SingleProductContainer(this,param1);
               break;
            case const_447:
               this.var_605 = new MultiProductContainer(this,param1);
               break;
            case const_516:
               this.var_605 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_728);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_728 = const_399;
            }
            else
            {
               this.var_728 = const_447;
            }
         }
         else if(param1.length > 1)
         {
            this.var_728 = const_516;
         }
         else
         {
            this.var_728 = const_1693;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1129 > 0 && this.var_1128 > 0)
         {
            this.var_1127 = const_1118;
         }
         else if(this.var_1129 > 0)
         {
            this.var_1127 = const_872;
         }
         else if(this.var_1128 > 0)
         {
            this.var_1127 = const_1235;
         }
         else
         {
            this.var_1127 = const_1728;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_364.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_605.products)
         {
            _loc4_ = this.var_364.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
