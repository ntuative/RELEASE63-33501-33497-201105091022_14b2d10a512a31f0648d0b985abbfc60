package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureIceStormLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_1889:int = 0;
      
      private var var_2565:Number = 0.0;
      
      private var var_1216:int = 0;
      
      public function FurnitureIceStormLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc2_ != null)
         {
            this.handleDataUpdateMessage(_loc2_);
            return;
         }
         super.processUpdateMessage(param1);
      }
      
      private function handleDataUpdateMessage(param1:RoomObjectDataUpdateMessage) : void
      {
         var _loc2_:int = param1.state / 1000;
         var _loc3_:int = param1.state % 1000;
         if(_loc3_ == 0)
         {
            this.var_1216 = 0;
            param1 = new RoomObjectDataUpdateMessage(_loc2_,String(_loc2_),param1.extra);
            super.processUpdateMessage(param1);
         }
         else
         {
            this.var_1889 = _loc2_;
            this.var_2565 = param1.extra;
            this.var_1216 = lastUpdateTime + _loc3_;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_1216 > 0 && param1 >= this.var_1216)
         {
            this.var_1216 = 0;
            _loc2_ = new RoomObjectDataUpdateMessage(this.var_1889,String(this.var_1889),this.var_2565);
            super.processUpdateMessage(_loc2_);
         }
         super.update(param1);
      }
   }
}
