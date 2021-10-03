package com.sulake.habbo.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_433:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_2053:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_433,false,false);
         this.var_2053 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_2053;
      }
   }
}
