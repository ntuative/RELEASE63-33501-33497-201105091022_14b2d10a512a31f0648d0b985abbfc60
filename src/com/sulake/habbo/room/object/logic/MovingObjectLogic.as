package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_876:int = 500;
      
      private static var var_648:Vector3d = new Vector3d();
       
      
      private var var_450:Vector3d;
      
      private var var_90:Vector3d;
      
      private var var_998:Number = 0.0;
      
      private var var_1914:int = 0;
      
      private var var_2610:int;
      
      private var var_1225:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_450 = new Vector3d();
         this.var_90 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1914;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_90 = null;
         this.var_450 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_90.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1225 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_90.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2610 = this.var_1914;
               this.var_450.assign(_loc3_);
               this.var_450.sub(this.var_90);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_998 != _loc2_.z)
               {
                  this.var_998 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_701,this.var_998);
               }
            }
            else if(this.var_998 != 0)
            {
               this.var_998 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_701,this.var_998);
            }
         }
         if(this.var_450.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2610;
            if(_loc4_ > this.var_1225)
            {
               _loc4_ = this.var_1225;
            }
            if(this.var_450.length > 0)
            {
               var_648.assign(this.var_450);
               var_648.mul(_loc4_ / Number(this.var_1225));
               var_648.add(this.var_90);
            }
            else
            {
               var_648.assign(this.var_90);
            }
            if(_loc2_ != null)
            {
               var_648.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_648);
            }
            if(_loc4_ == this.var_1225)
            {
               this.var_450.x = 0;
               this.var_450.y = 0;
               this.var_450.z = 0;
            }
         }
         this.var_1914 = param1;
      }
   }
}
