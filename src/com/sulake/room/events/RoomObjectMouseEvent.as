package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_170:String = "ROE_MOUSE_CLICK";
      
      public static const const_187:String = "ROE_MOUSE_ENTER";
      
      public static const const_545:String = "ROE_MOUSE_MOVE";
      
      public static const const_189:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2080:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_597:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2042:String = "";
      
      private var var_2180:Boolean;
      
      private var var_2181:Boolean;
      
      private var var_2182:Boolean;
      
      private var var_2183:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2042 = param2;
         this.var_2180 = param5;
         this.var_2181 = param6;
         this.var_2182 = param7;
         this.var_2183 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2042;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2180;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2181;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2182;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2183;
      }
   }
}
