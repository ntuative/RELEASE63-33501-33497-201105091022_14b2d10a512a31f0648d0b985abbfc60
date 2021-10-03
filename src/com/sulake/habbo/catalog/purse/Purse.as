package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_213:int = 0;
       
      
      private var var_2071:int = 0;
      
      private var var_1370:Dictionary;
      
      private var var_1650:int = 0;
      
      private var var_1651:int = 0;
      
      private var var_2191:Boolean = false;
      
      private var var_2192:int = 0;
      
      private var var_2190:int = 0;
      
      public function Purse()
      {
         this.var_1370 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2071;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2071 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1650;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1650 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1651;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1651 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1650 > 0 || this.var_1651 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2191;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2191 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2192;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2192 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2190;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2190 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1370;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1370 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1370[param1];
      }
   }
}
