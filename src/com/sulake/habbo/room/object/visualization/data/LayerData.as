package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_725:String = "";
      
      public static const const_416:int = 0;
      
      public static const const_603:int = 255;
      
      public static const const_990:Boolean = false;
      
      public static const const_480:int = 0;
      
      public static const const_615:int = 0;
      
      public static const const_434:int = 0;
      
      public static const const_1165:int = 1;
      
      public static const const_1232:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2184:String = "";
      
      private var var_2081:int = 0;
      
      private var var_2213:int = 255;
      
      private var var_2782:Boolean = false;
      
      private var var_2783:int = 0;
      
      private var var_2781:int = 0;
      
      private var var_2780:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2184 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2184;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2081 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2081;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2213 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2213;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2782 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2782;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2783 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2783;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2781 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2781;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2780 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2780;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
