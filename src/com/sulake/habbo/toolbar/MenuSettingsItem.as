package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2474:String;
      
      private var var_2473:Array;
      
      private var var_2475:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2474 = param1;
         this.var_2473 = param2;
         this.var_2475 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2474;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2473;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2475;
      }
   }
}
