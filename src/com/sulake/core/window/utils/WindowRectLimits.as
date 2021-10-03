package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_292:int = -2.147483648E9;
      
      private var var_290:int = 2.147483647E9;
      
      private var var_293:int = -2.147483648E9;
      
      private var var_291:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_292;
      }
      
      public function get maxWidth() : int
      {
         return this.var_290;
      }
      
      public function get minHeight() : int
      {
         return this.var_293;
      }
      
      public function get maxHeight() : int
      {
         return this.var_291;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_292 = param1;
         if(this.var_292 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_292)
         {
            this._target.width = this.var_292;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_290 = param1;
         if(this.var_290 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_290)
         {
            this._target.width = this.var_290;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_293 = param1;
         if(this.var_293 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_293)
         {
            this._target.height = this.var_293;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_291 = param1;
         if(this.var_291 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_291)
         {
            this._target.height = this.var_291;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_292 == int.MIN_VALUE && this.var_290 == int.MAX_VALUE && this.var_293 == int.MIN_VALUE && this.var_291 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_292 = int.MIN_VALUE;
         this.var_290 = int.MAX_VALUE;
         this.var_293 = int.MIN_VALUE;
         this.var_291 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_292)
            {
               this._target.width = this.var_292;
            }
            else if(this._target.width > this.var_290)
            {
               this._target.width = this.var_290;
            }
            if(this._target.height < this.var_293)
            {
               this._target.height = this.var_293;
            }
            else if(this._target.height > this.var_291)
            {
               this._target.height = this.var_291;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_292 = param1;
         this.var_290 = param2;
         this.var_293 = param3;
         this.var_291 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_292 = this.var_292;
         _loc2_.var_290 = this.var_290;
         _loc2_.var_293 = this.var_293;
         _loc2_.var_291 = this.var_291;
         return _loc2_;
      }
   }
}
