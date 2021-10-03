package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_987:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_271:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_987,param2,param3);
         this.var_271 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_271;
      }
   }
}
