package com.sulake.habbo.room.object.logic.room.publicroom
{
   import com.sulake.habbo.room.RoomVariableEnum;
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.room.RoomLogic;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class PublicRoomLogic extends RoomLogic
   {
       
      
      private var var_722:Boolean = false;
      
      private var var_1575:int = 0;
      
      public function PublicRoomLogic()
      {
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectRoomAdEvent.const_198,RoomObjectRoomAdEvent.const_351,RoomObjectRoomAdEvent.const_323];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function initialize(param1:XML) : void
      {
         super.initialize(param1);
         if(param1 == null || object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.setString(RoomObjectVariableEnum.const_439,"");
         _loc2_.setString(RoomObjectVariableEnum.const_805,"");
         _loc2_.setNumber(RoomObjectVariableEnum.const_649,Number(false));
         this.var_722 = true;
      }
      
      override public function update(param1:int) : void
      {
         super.update(param1);
         if(this.var_1575 > 0 && param1 > this.var_1575)
         {
            this.adDelayTimeout();
            this.var_1575 = 0;
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         if(param1 == null || object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:RoomObjectRoomAdUpdateMessage = param1 as RoomObjectRoomAdUpdateMessage;
         if(_loc3_ != null)
         {
            switch(_loc3_.type)
            {
               case RoomObjectRoomAdUpdateMessage.const_1329:
                  _loc2_.setString(RoomObjectVariableEnum.const_439,_loc3_.asset);
                  _loc2_.setString(RoomObjectVariableEnum.const_805,_loc3_.clickUrl);
                  _loc2_.setNumber(RoomObjectVariableEnum.const_649,Number(true));
                  this.var_1575 = getTimer() + _loc2_.getNumber(RoomVariableEnum.const_1236);
            }
         }
      }
      
      public function adDelayTimeout() : void
      {
         if(object == null)
         {
            return;
         }
         var _loc1_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.setNumber(RoomObjectVariableEnum.const_649,Number(false));
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc7_:* = null;
         super.mouseEvent(param1,param2);
         var _loc3_:RoomSpriteMouseEvent = param1;
         if(_loc3_ == null)
         {
            return;
         }
         if(object == null || param1 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = object.getId();
         var _loc6_:String = object.getType();
         switch(_loc3_.type)
         {
            case MouseEvent.CLICK:
               if(_loc3_.spriteTag == RoomObjectVariableEnum.const_535)
               {
                  _loc7_ = _loc4_.getString(RoomObjectVariableEnum.const_805);
                  if(_loc7_ != null && _loc7_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_198,_loc5_,_loc6_,_loc7_));
                     HabboWebTools.openWebPage(_loc7_);
                  }
               }
               break;
            case MouseEvent.ROLL_OVER:
               if(_loc3_.spriteTag == RoomObjectVariableEnum.const_535)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_351,_loc5_,_loc6_));
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(_loc3_.spriteTag == RoomObjectVariableEnum.const_535)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_323,_loc5_,_loc6_));
               }
         }
      }
   }
}
