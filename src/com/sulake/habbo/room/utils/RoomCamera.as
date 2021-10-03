package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1424:Number = 12;
       
      
      private var var_2411:int = -1;
      
      private var var_2412:int = -2;
      
      private var var_202:Vector3d = null;
      
      private var var_1187:Number = 0;
      
      private var var_1461:Number = 0;
      
      private var var_1805:Boolean = false;
      
      private var var_174:Vector3d = null;
      
      private var var_1801:Vector3d;
      
      private var var_2415:Boolean = false;
      
      private var var_2416:Boolean = false;
      
      private var var_2417:Boolean = false;
      
      private var var_2419:Boolean = false;
      
      private var var_2418:int = 0;
      
      private var var_2413:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2414:int = 0;
      
      private var var_2410:int = 0;
      
      private var var_1802:int = -1;
      
      private var var_1803:int = 0;
      
      private var var_1804:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1801 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_174;
      }
      
      public function get targetId() : int
      {
         return this.var_2411;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2412;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1801;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2415;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2416;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2417;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2419;
      }
      
      public function get method_2() : int
      {
         return this.var_2418;
      }
      
      public function get screenHt() : int
      {
         return this.var_2413;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2414;
      }
      
      public function get roomHt() : int
      {
         return this.var_2410;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1802;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_202 != null && this.var_174 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2411 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1801.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2412 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2415 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2416 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2417 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2419 = param1;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2418 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2413 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1804 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2414 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2410 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1802 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_202 == null)
         {
            this.var_202 = new Vector3d();
         }
         if(this.var_202.x != param1.x || this.var_202.y != param1.y || this.var_202.z != param1.z)
         {
            this.var_202.assign(param1);
            this.var_1803 = 0;
            _loc2_ = Vector3d.dif(this.var_202,this.var_174);
            this.var_1187 = _loc2_.length;
            this.var_1805 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_202 = null;
         this.var_174 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_174 != null)
         {
            return;
         }
         this.var_174 = new Vector3d();
         this.var_174.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_174 == null)
         {
            this.var_174 = new Vector3d();
         }
         this.var_174.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_202 != null && this.var_174 != null)
         {
            ++this.var_1803;
            if(this.var_1804)
            {
               this.var_1804 = false;
               this.var_174 = this.var_202;
               this.var_202 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_202,this.var_174);
            if(_loc3_.length > this.var_1187)
            {
               this.var_1187 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_174 = this.var_202;
               this.var_202 = null;
               this.var_1461 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1187);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1187 / const_1424;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1805)
               {
                  if(_loc7_ < this.var_1461)
                  {
                     _loc7_ = this.var_1461;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1805 = false;
                  }
               }
               this.var_1461 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_174 = Vector3d.sum(this.var_174,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1802 = -1;
      }
   }
}
