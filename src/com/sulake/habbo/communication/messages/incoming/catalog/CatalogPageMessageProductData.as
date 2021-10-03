package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_83:String = "s";
      
      public static const const_200:String = "e";
       
      
      private var var_1450:String;
      
      private var var_2650:int;
      
      private var var_1180:String;
      
      private var _productCount:int;
      
      private var var_1779:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1450 = param1.readString();
         this.var_2650 = param1.readInteger();
         this.var_1180 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_1779 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1450;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2650;
      }
      
      public function get extraParam() : String
      {
         return this.var_1180;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_1779;
      }
   }
}
