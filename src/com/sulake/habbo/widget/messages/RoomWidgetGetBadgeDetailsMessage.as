package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_738:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1371:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_738);
         this.var_1371 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1371;
      }
   }
}
