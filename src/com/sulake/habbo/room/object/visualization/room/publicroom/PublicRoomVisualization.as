package com.sulake.habbo.room.object.visualization.room.publicroom
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.room.RoomVisualization;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class PublicRoomVisualization extends RoomVisualization
   {
       
      
      protected var var_1352:int = 0;
      
      private var var_2393:Boolean = false;
      
      public function PublicRoomVisualization()
      {
         super();
      }
      
      override public function get floorRelativeDepth() : Number
      {
         return 131;
      }
      
      override public function get wallRelativeDepth() : Number
      {
         return 135;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!param1 is PublicRoomVisualizationData)
         {
            return false;
         }
         return super.initialize(param1);
      }
      
      private function addSprites(param1:int) : void
      {
         createSprites(this.var_1352 + param1);
      }
      
      protected function get data() : PublicRoomVisualizationData
      {
         return _data as PublicRoomVisualizationData;
      }
      
      private function initializeLayout(param1:IRoomGeometry) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_2393)
         {
            return;
         }
         if(this.data != null)
         {
            this.var_1352 = spriteCount;
            _loc2_ = object.getModel();
            _loc3_ = _loc2_.getString(RoomObjectVariableEnum.const_1327);
            this.data.layoutRasterizer.layout = _loc3_;
            this.data.layoutRasterizer.initializeGeometry(param1);
            this.addSprites(this.data.layoutRasterizer.elementCount());
            _loc4_ = 0;
            while(_loc4_ < this.data.layoutRasterizer.elementCount())
            {
               this.data.layoutRasterizer.setElementToSprite(_loc4_,getSprite(_loc4_ + this.var_1352));
               _loc4_++;
            }
            this.data.layoutRasterizer.initializeAds(this.var_1352,this);
         }
         this.var_2393 = true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         super.update(param1,param2,param3,param4);
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         this.initializeLayout(param1);
         var _loc6_:IRoomObjectModel = object.getModel();
         var _loc7_:String = _loc6_.getString(RoomObjectVariableEnum.const_439);
         var _loc8_:* = !Boolean(_loc6_.getNumber(RoomObjectVariableEnum.const_649));
         if(_loc7_ != "" && this.data != null)
         {
            this.data.layoutRasterizer.showAd(this,_loc7_,_loc8_);
         }
      }
   }
}
