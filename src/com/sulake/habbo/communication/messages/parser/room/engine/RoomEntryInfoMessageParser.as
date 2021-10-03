package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1941:Boolean;
      
      private var var_2658:int;
      
      private var var_421:Boolean;
      
      private var var_1255:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1941;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2658;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1255;
      }
      
      public function get owner() : Boolean
      {
         return this.var_421;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1255 != null)
         {
            this.var_1255.dispose();
            this.var_1255 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1941 = param1.readBoolean();
         if(this.var_1941)
         {
            this.var_2658 = param1.readInteger();
            this.var_421 = param1.readBoolean();
         }
         else
         {
            this.var_1255 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
