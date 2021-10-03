package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1440:int = 3;
      
      private static const const_1472:int = 2;
      
      private static const const_1473:int = 1;
      
      private static const const_1471:int = 15;
       
      
      private var var_306:Array;
      
      private var var_1239:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_306 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1472)
         {
            this.var_306 = new Array();
            this.var_306.push(const_1473);
            this.var_1239 = const_1471;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1239 > 0)
         {
            --this.var_1239;
         }
         if(this.var_1239 == 0)
         {
            if(this.var_306.length > 0)
            {
               super.setAnimation(this.var_306.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
