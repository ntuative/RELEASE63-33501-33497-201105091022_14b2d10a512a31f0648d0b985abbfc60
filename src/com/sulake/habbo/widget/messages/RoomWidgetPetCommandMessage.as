package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_934:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_571:String = "RWPCM_PET_COMMAND";
       
      
      private var var_2038:int = 0;
      
      private var var_185:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_2038 = param2;
         this.var_185 = param3;
      }
      
      public function get petId() : int
      {
         return this.var_2038;
      }
      
      public function get value() : String
      {
         return this.var_185;
      }
   }
}
