package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1671:int;
      
      private var var_1991:Number;
      
      private var var_2734:Number;
      
      private var var_2737:int;
      
      private var var_2735:Number;
      
      private var var_2736:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1671 = param1;
         this.var_1991 = param2;
         this.var_2734 = param3;
         this.var_2735 = param4;
         this.var_2736 = param5;
         this.var_2737 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1671;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1991 < 0)
         {
            return 0;
         }
         return this.var_1991 + (getTimer() - this.var_2737) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2734;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2735;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2736;
      }
   }
}
