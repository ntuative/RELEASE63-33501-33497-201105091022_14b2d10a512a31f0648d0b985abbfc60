package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1164:Boolean;
      
      private var var_2677:int;
      
      private var var_2679:String;
      
      private var var_350:int;
      
      private var var_2675:int;
      
      private var var_2330:String;
      
      private var var_2678:String;
      
      private var var_2676:String;
      
      private var var_878:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_878 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1164 = false;
            return;
         }
         this.var_1164 = true;
         this.var_2677 = int(_loc2_);
         this.var_2679 = param1.readString();
         this.var_350 = int(param1.readString());
         this.var_2675 = param1.readInteger();
         this.var_2330 = param1.readString();
         this.var_2678 = param1.readString();
         this.var_2676 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_878.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_878 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2677;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2679;
      }
      
      public function get flatId() : int
      {
         return this.var_350;
      }
      
      public function get eventType() : int
      {
         return this.var_2675;
      }
      
      public function get eventName() : String
      {
         return this.var_2330;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2678;
      }
      
      public function get creationTime() : String
      {
         return this.var_2676;
      }
      
      public function get tags() : Array
      {
         return this.var_878;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1164;
      }
   }
}
