package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2520:int = 0;
      
      private var var_1472:String = "";
      
      private var var_1844:String = "";
      
      private var var_2470:String = "";
      
      private var var_2521:String = "";
      
      private var var_1873:int = 0;
      
      private var var_2522:int = 0;
      
      private var var_2523:int = 0;
      
      private var var_1474:int = 0;
      
      private var var_2524:int = 0;
      
      private var var_1471:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2520 = param1;
         this.var_1472 = param2;
         this.var_1844 = param3;
         this.var_2470 = param4;
         this.var_2521 = param5;
         if(param6)
         {
            this.var_1873 = 1;
         }
         else
         {
            this.var_1873 = 0;
         }
         this.var_2522 = param7;
         this.var_2523 = param8;
         this.var_1474 = param9;
         this.var_2524 = param10;
         this.var_1471 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2520,this.var_1472,this.var_1844,this.var_2470,this.var_2521,this.var_1873,this.var_2522,this.var_2523,this.var_1474,this.var_2524,this.var_1471];
      }
   }
}
