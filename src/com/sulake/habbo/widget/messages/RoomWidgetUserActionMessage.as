package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_486:String = "RWUAM_WHISPER_USER";
      
      public static const const_566:String = "RWUAM_IGNORE_USER";
      
      public static const const_556:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_441:String = "RWUAM_KICK_USER";
      
      public static const const_562:String = "RWUAM_BAN_USER";
      
      public static const const_524:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_493:String = "RWUAM_RESPECT_USER";
      
      public static const const_599:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_650:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_601:String = "RWUAM_START_TRADING";
      
      public static const const_759:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_591:String = "RWUAM_KICK_BOT";
      
      public static const const_520:String = "RWUAM_REPORT";
      
      public static const const_581:String = "RWUAM_PICKUP_PET";
      
      public static const const_1754:String = "RWUAM_TRAIN_PET";
      
      public static const const_541:String = " RWUAM_RESPECT_PET";
      
      public static const const_432:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_922:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
