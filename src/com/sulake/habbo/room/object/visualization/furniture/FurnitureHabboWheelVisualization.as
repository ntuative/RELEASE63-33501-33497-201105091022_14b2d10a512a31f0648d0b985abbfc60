package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1035:int = 10;
      
      private static const const_668:int = 20;
      
      private static const const_1439:int = 31;
      
      private static const const_1440:int = 32;
       
      
      private var var_306:Array;
      
      private var var_803:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_306 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_803)
            {
               this.var_803 = true;
               this.var_306 = new Array();
               this.var_306.push(const_1439);
               this.var_306.push(const_1440);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_1035)
         {
            if(this.var_803)
            {
               this.var_803 = false;
               this.var_306 = new Array();
               this.var_306.push(const_1035 + param1);
               this.var_306.push(const_668 + param1);
               this.var_306.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
