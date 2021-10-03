package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_837:TileHeightMap = null;
      
      private var var_1290:LegacyWallGeometry = null;
      
      private var var_1289:RoomCamera = null;
      
      private var var_838:SelectedRoomObjectData = null;
      
      private var var_839:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_549:Map;
      
      private var var_550:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_549 = new Map();
         this.var_550 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1290 = new LegacyWallGeometry();
         this.var_1289 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_837;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_837 != null)
         {
            this.var_837.dispose();
         }
         this.var_837 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1290;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1289;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_838;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_838 != null)
         {
            this.var_838.dispose();
         }
         this.var_838 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_839;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_839 != null)
         {
            this.var_839.dispose();
         }
         this.var_839 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_837 != null)
         {
            this.var_837.dispose();
            this.var_837 = null;
         }
         if(this.var_1290 != null)
         {
            this.var_1290.dispose();
            this.var_1290 = null;
         }
         if(this.var_1289 != null)
         {
            this.var_1289.dispose();
            this.var_1289 = null;
         }
         if(this.var_838 != null)
         {
            this.var_838.dispose();
            this.var_838 = null;
         }
         if(this.var_839 != null)
         {
            this.var_839.dispose();
            this.var_839 = null;
         }
         if(this.var_549 != null)
         {
            this.var_549.dispose();
            this.var_549 = null;
         }
         if(this.var_550 != null)
         {
            this.var_550.dispose();
            this.var_550 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_549.remove(param1.id);
            this.var_549.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_549.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_549.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_549.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_550.remove(param1.id);
            this.var_550.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_550.length > 0)
         {
            return this.getWallItemDataWithId(this.var_550.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_550.remove(param1);
      }
   }
}
