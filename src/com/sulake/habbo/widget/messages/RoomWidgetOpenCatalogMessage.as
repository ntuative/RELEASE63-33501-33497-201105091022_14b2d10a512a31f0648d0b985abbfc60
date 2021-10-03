package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_403:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1199:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1192:String = "RWOCM_PIXELS";
      
      public static const const_1151:String = "RWOCM_CREDITS";
       
      
      private var var_2666:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_403);
         this.var_2666 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2666;
      }
   }
}
