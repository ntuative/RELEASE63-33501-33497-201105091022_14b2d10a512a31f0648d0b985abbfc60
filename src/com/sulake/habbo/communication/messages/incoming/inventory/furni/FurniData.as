package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2366:int;
      
      private var var_1564:String;
      
      private var _objId:int;
      
      private var var_1792:int;
      
      private var _category:int;
      
      private var var_2156:String;
      
      private var var_2805:Boolean;
      
      private var var_2804:Boolean;
      
      private var var_2806:Boolean;
      
      private var var_2364:Boolean;
      
      private var var_2188:int;
      
      private var var_1451:int;
      
      private var var_1769:String = "";
      
      private var var_1671:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2366 = param1;
         this.var_1564 = param2;
         this._objId = param3;
         this.var_1792 = param4;
         this._category = param5;
         this.var_2156 = param6;
         this.var_2805 = param7;
         this.var_2804 = param8;
         this.var_2806 = param9;
         this.var_2364 = param10;
         this.var_2188 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1769 = param1;
         this.var_1451 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2366;
      }
      
      public function get itemType() : String
      {
         return this.var_1564;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1792;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2156;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2805;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2804;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2806;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2364;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2188;
      }
      
      public function get slotId() : String
      {
         return this.var_1769;
      }
      
      public function get songId() : int
      {
         return this.var_1671;
      }
      
      public function get extra() : int
      {
         return this.var_1451;
      }
   }
}
