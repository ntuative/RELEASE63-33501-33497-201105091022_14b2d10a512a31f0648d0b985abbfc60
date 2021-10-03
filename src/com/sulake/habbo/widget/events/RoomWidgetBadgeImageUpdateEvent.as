package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_813:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2582:String;
      
      private var var_2581:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_813,param3,param4);
         this.var_2582 = param1;
         this.var_2581 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2582;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2581;
      }
   }
}
