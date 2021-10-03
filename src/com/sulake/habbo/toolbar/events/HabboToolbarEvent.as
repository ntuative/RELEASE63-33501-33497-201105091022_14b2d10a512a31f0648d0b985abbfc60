package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_73:String = "HTE_INITIALIZED";
      
      public static const const_35:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_611:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_762:String = "HTE_TOOLBAR_RESIZED";
      
      public static const const_365:String = "HTE_TOOLBAR_STATE_HOTEL_VIEW";
      
      public static const const_335:String = "HTE_TOOLBAR_STATE_ROOM_VIEW";
       
      
      private var var_758:String;
      
      private var var_566:String;
      
      private var var_1168:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_758 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_758;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_566 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_566;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1168 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1168;
      }
   }
}
