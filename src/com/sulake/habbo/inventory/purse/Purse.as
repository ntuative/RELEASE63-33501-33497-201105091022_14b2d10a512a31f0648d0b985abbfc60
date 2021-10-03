package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1650:int = 0;
      
      private var var_1651:int = 0;
      
      private var var_2634:int = 0;
      
      private var var_2635:Boolean = false;
      
      private var var_2191:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1650 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1651 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2634 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2635 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2191 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1650;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1651;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2634;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2635;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2191;
      }
   }
}
