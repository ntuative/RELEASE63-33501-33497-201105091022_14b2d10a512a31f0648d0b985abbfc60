package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class PlacedObjectPurchaseData implements IDisposable
   {
       
      
      private var var_1091:Boolean = false;
      
      private var var_193:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_1895:String = "";
      
      private var _x:int = 0;
      
      private var var_164:int = 0;
      
      private var _direction:int = 0;
      
      private var _offerId:int;
      
      private var var_1777:int;
      
      private var var_1778:IProductData;
      
      private var var_660:IFurnitureData;
      
      private var var_1521:String;
      
      public function PlacedObjectPurchaseData(param1:int, param2:int, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int, param9:IPurchasableOffer)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_193 = param3;
         this._category = param4;
         this.var_1895 = param5;
         this._x = param6;
         this.var_164 = param7;
         this._direction = param8;
         this.setOfferData(param9);
      }
      
      public function dispose() : void
      {
         this.var_1091 = true;
         this.var_1778 = null;
         this.var_660 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1091;
      }
      
      private function setOfferData(param1:IPurchasableOffer) : void
      {
         this._offerId = param1.offerId;
         this.var_1777 = param1.productContainer.firstProduct.productClassId;
         this.var_1778 = param1.productContainer.firstProduct.productData;
         this.var_660 = param1.productContainer.firstProduct.furnitureData;
         this.var_1521 = param1.productContainer.firstProduct.extraParam;
      }
      
      public function toString() : String
      {
         return [this._roomCategory,this._roomId,this.var_193,this._category,this.var_1895,this._x,this.var_164,this._direction,this._offerId,this.var_1777].toString();
      }
      
      public function get objectId() : int
      {
         return this.var_193;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get wallLocation() : String
      {
         return this.var_1895;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_164;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productClassId() : int
      {
         return this.var_1777;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1521;
      }
      
      public function get furniData() : IFurnitureData
      {
         return this.var_660;
      }
   }
}
