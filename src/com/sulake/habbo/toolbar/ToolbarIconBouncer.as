package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2228:Number;
      
      private var var_1863:Number;
      
      private var var_902:Number;
      
      private var var_435:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2228 = param1;
         this.var_1863 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_902 = param1;
         this.var_435 = 0;
      }
      
      public function update() : void
      {
         this.var_902 += this.var_1863;
         this.var_435 += this.var_902;
         if(this.var_435 > 0)
         {
            this.var_435 = 0;
            this.var_902 = this.var_2228 * -1 * this.var_902;
         }
      }
      
      public function get location() : Number
      {
         return this.var_435;
      }
   }
}
