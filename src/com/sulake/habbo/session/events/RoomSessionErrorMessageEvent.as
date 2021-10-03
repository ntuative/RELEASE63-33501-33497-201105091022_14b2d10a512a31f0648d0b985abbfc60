package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionErrorMessageEvent extends RoomSessionEvent
   {
      
      public static const const_1196:String = "RSEME_DOOR_OTHER_DELETED";
      
      public static const const_1144:String = "RSEME_DOOR_NOT_INSTALLED";
      
      public static const const_258:String = "RSEME_CANT_TRADE_STUFF";
      
      public static const const_257:String = "RSEME_INVALID_ITEM_LOC";
      
      public static const const_822:String = "RSEME_CANT_SET_NOT_OWNER";
      
      public static const const_267:String = "RSEME_MAX_STICKIES";
      
      public static const const_244:String = "RSEME_MAX_FURNITURE";
      
      public static const const_245:String = "RSEME_MAX_QUEUE";
      
      public static const const_283:String = "RSEME_MAX_SOUND";
      
      public static const const_300:String = "RSEME_KICKED";
      
      public static const const_265:String = "RSEME_GUIDE_BUSY";
      
      public static const const_251:String = "RSEME_GUIDE_EXISTS";
      
      public static const const_854:String = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
      
      public static const const_792:String = "RSEME_PETS_FORBIDDEN_IN_FLAT";
      
      public static const const_217:String = "RSEME_MAX_PETS";
      
      public static const const_697:String = "RSEME_NO_FREE_TILES_FOR_PET";
      
      public static const const_899:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
       
      
      private var _message:String;
      
      public function RoomSessionErrorMessageEvent(param1:String, param2:IRoomSession, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param4,param5);
         this._message = param3;
      }
      
      public function get message() : String
      {
         return this._message;
      }
   }
}
