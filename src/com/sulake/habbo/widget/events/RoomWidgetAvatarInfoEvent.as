package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:String = "RWAIE_AVATAR_INFO";
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2176:Boolean;
      
      private var var_2311:int;
      
      public function RoomWidgetAvatarInfoEvent(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_129,param5,param6);
         this._userId = param1;
         this._userName = param2;
         this.var_2311 = param3;
         this.var_2176 = param4;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2311;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2176;
      }
   }
}
