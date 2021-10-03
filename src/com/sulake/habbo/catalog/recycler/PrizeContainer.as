package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_2368:String;
      
      private var var_1772:int;
      
      private var var_2369:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_2981:PrizeGridItem;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_2368 = param1;
         this.var_1772 = param2;
         this._furnitureData = param3;
         this.var_2369 = param4;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         if(param1 == null || this._furnitureData == null)
         {
            return;
         }
         initProductIcon(param1,this._furnitureData.type,this.var_1772);
      }
      
      public function get productItemType() : String
      {
         return this.var_2368;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1772;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return this.var_2981;
      }
      
      public function get oddsLevelId() : int
      {
         return this.var_2369;
      }
      
      public function get title() : String
      {
         if(this._furnitureData == null)
         {
            return "";
         }
         return this._furnitureData.title;
      }
   }
}
