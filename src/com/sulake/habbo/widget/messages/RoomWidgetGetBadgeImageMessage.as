package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_709:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_311:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_709);
         this.var_311 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_311;
      }
   }
}
