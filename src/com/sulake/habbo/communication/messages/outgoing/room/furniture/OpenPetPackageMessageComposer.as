package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_193:int;
      
      private var var_2428:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_193 = param1;
         this.var_2428 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_193,this.var_2428];
      }
      
      public function dispose() : void
      {
      }
   }
}
