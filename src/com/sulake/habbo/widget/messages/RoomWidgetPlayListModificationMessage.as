package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPlayListModificationMessage extends RoomWidgetMessage
   {
      
      public static const const_884:String = "RWPLAM_ADD_TO_PLAYLIST";
      
      public static const const_769:String = "RWPLAM_REMOVE_FROM_PLAYLIST";
       
      
      private var var_2487:int;
      
      private var var_2539:int;
      
      public function RoomWidgetPlayListModificationMessage(param1:String, param2:int = -1, param3:int = -1)
      {
         super(param1);
         this.var_2539 = param2;
         this.var_2487 = param3;
      }
      
      public function get diskId() : int
      {
         return this.var_2487;
      }
      
      public function get slotNumber() : int
      {
         return this.var_2539;
      }
   }
}
