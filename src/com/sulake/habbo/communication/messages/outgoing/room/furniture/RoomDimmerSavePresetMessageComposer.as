package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2435:int;
      
      private var var_2436:int;
      
      private var var_2433:String;
      
      private var var_2437:int;
      
      private var var_2434:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2435 = param1;
         this.var_2436 = param2;
         this.var_2433 = param3;
         this.var_2437 = param4;
         this.var_2434 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2435,this.var_2436,this.var_2433,this.var_2437,int(this.var_2434)];
      }
      
      public function dispose() : void
      {
      }
   }
}
