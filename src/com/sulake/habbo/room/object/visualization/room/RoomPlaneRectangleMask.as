package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2518:Number = 0.0;
      
      private var var_2519:Number = 0.0;
      
      private var var_2571:Number = 0.0;
      
      private var var_2570:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2518 = param1;
         this.var_2519 = param2;
         this.var_2571 = param3;
         this.var_2570 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2518;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2519;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2571;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2570;
      }
   }
}
