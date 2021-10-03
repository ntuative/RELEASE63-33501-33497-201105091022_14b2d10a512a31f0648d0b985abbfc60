package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2070:Boolean;
      
      private var _roomId:int;
      
      private var var_1005:String;
      
      private var var_2764:int;
      
      private var var_2763:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2070 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_1005 = param1.readString();
         this.var_2764 = param1.readInteger();
         this.var_2763 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2070;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_1005;
      }
      
      public function get enterHour() : int
      {
         return this.var_2764;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2763;
      }
   }
}
