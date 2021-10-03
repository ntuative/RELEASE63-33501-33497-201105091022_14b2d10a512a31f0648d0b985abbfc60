package com.sulake.habbo.widget.events
{
   public class RoomWidgetSongUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_384:String = "RWSUE_PLAYING_CHANGED";
      
      public static const const_388:String = "RWSUE_DATA_RECEIVED";
       
      
      private var var_1671:int;
      
      private var _songName:String;
      
      private var var_2853:String;
      
      public function RoomWidgetSongUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.var_1671 = param2;
         this._songName = param3;
         this.var_2853 = param4;
      }
      
      public function get songId() : int
      {
         return this.var_1671;
      }
      
      public function get songName() : String
      {
         return this._songName;
      }
      
      public function get songAuthor() : String
      {
         return this.var_2853;
      }
   }
}
