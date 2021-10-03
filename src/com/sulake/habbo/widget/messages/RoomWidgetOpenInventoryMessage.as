package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_944:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1274:String = "inventory_effects";
      
      public static const const_1242:String = "inventory_badges";
      
      public static const const_1649:String = "inventory_clothes";
      
      public static const const_1799:String = "inventory_furniture";
       
      
      private var var_2656:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_944);
         this.var_2656 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2656;
      }
   }
}
