package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_614:String;
      
      private var var_2306:String;
      
      private var var_933:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_614 = param1;
         this.var_933 = param2;
         this.var_2306 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function get race() : String
      {
         return this.var_2306;
      }
      
      public function get gender() : String
      {
         return this.var_933;
      }
   }
}
