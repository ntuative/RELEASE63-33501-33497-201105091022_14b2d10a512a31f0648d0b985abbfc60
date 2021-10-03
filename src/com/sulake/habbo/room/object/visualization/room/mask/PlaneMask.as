package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IVector3d;
   
   public class PlaneMask
   {
       
      
      private var var_568:Map;
      
      private var _sizes:Array;
      
      private var var_1334:PlaneMaskVisualization = null;
      
      private var var_2391:int = -1;
      
      public function PlaneMask()
      {
         this._sizes = [];
         super();
         this.var_568 = new Map();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(this.var_568 != null)
         {
            _loc1_ = null;
            _loc2_ = 0;
            while(_loc2_ < this.var_568.length)
            {
               _loc1_ = this.var_568.getWithIndex(_loc2_) as PlaneMaskVisualization;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            this.var_568.dispose();
            this.var_568 = null;
         }
         this.var_1334 = null;
         this._sizes = null;
      }
      
      public function createMaskVisualization(param1:int) : PlaneMaskVisualization
      {
         if(this.var_568.getValue(String(param1)) != null)
         {
            return null;
         }
         var _loc2_:PlaneMaskVisualization = new PlaneMaskVisualization();
         this.var_568.add(String(param1),_loc2_);
         this._sizes.push(param1);
         this._sizes.sort();
         return _loc2_;
      }
      
      private function getSizeIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 1;
         while(_loc3_ < this._sizes.length)
         {
            if(this._sizes[_loc3_] > param1)
            {
               if(this._sizes[_loc3_] - param1 < param1 - this._sizes[_loc3_ - 1])
               {
                  _loc2_ = _loc3_;
               }
               break;
            }
            _loc2_ = _loc3_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function getMaskVisualization(param1:int) : PlaneMaskVisualization
      {
         if(param1 == this.var_2391)
         {
            return this.var_1334;
         }
         var _loc2_:int = this.getSizeIndex(param1);
         if(_loc2_ < this._sizes.length)
         {
            this.var_1334 = this.var_568.getValue(String(this._sizes[_loc2_])) as PlaneMaskVisualization;
         }
         else
         {
            this.var_1334 = null;
         }
         this.var_2391 = param1;
         return this.var_1334;
      }
      
      public function getGraphicAsset(param1:Number, param2:IVector3d) : IGraphicAsset
      {
         var _loc3_:PlaneMaskVisualization = this.getMaskVisualization(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getAsset(param2);
      }
   }
}
