package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2543:int;
      
      private var var_1564:String;
      
      private var var_2542:int;
      
      private var var_2546:int;
      
      private var _category:int;
      
      private var var_2156:String;
      
      private var var_1451:int;
      
      private var var_2540:int;
      
      private var var_2544:int;
      
      private var var_2547:int;
      
      private var var_2545:int;
      
      private var var_2541:Boolean;
      
      private var var_3029:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2543 = param1;
         this.var_1564 = param2;
         this.var_2542 = param3;
         this.var_2546 = param4;
         this._category = param5;
         this.var_2156 = param6;
         this.var_1451 = param7;
         this.var_2540 = param8;
         this.var_2544 = param9;
         this.var_2547 = param10;
         this.var_2545 = param11;
         this.var_2541 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2543;
      }
      
      public function get itemType() : String
      {
         return this.var_1564;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2542;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2546;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2156;
      }
      
      public function get extra() : int
      {
         return this.var_1451;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2540;
      }
      
      public function get creationDay() : int
      {
         return this.var_2544;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2547;
      }
      
      public function get creationYear() : int
      {
         return this.var_2545;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2541;
      }
      
      public function get method_4() : int
      {
         return this.var_1451;
      }
   }
}
