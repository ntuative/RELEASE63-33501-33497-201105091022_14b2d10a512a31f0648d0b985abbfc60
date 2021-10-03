package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const const_609:int = -1;
      
      public static const const_1170:int = -1;
      
      private static const const_1455:int = 3000;
      
      private static const POOL:Array = [];
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_164:int = 0;
      
      private var var_2356:int = 1;
      
      private var var_979:int = 1;
      
      private var var_1886:int = 1;
      
      private var var_2564:int = -1;
      
      private var var_2563:int = 0;
      
      private var var_2562:Boolean = false;
      
      private var _isRecycled:Boolean = false;
      
      public function AnimationFrame()
      {
         super();
      }
      
      public static function allocate(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0) : AnimationFrame
      {
         var _loc9_:AnimationFrame = false ? POOL.pop() : new AnimationFrame();
         _loc9_._isRecycled = false;
         _loc9_._id = param1;
         _loc9_._x = param2;
         _loc9_.var_164 = param3;
         _loc9_.var_2562 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         _loc9_.var_2356 = param4;
         if(param5 < 0)
         {
            param5 = const_609;
         }
         _loc9_.var_979 = param5;
         _loc9_.var_1886 = param5;
         if(param7 >= 0)
         {
            _loc9_.var_2564 = param7;
            _loc9_.var_2563 = param8;
         }
         return _loc9_;
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_164;
      }
      
      public function get repeats() : int
      {
         return this.var_2356;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_979;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2562;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_979 < 0)
         {
            return const_609;
         }
         return this.var_1886;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_979 > 0 && param1 > this.var_979)
         {
            param1 = this.var_979;
         }
         this.var_1886 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2564;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2563;
      }
      
      public function recycle() : void
      {
         if(!this._isRecycled)
         {
            this._isRecycled = true;
            if(POOL.length < const_1455)
            {
               POOL.push(this);
            }
         }
      }
   }
}
