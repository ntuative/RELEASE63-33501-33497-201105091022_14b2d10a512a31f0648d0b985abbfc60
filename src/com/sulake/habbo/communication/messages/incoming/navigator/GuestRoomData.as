package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_350:int;
      
      private var var_763:Boolean;
      
      private var var_1005:String;
      
      private var _ownerName:String;
      
      private var var_2384:int;
      
      private var var_2618:int;
      
      private var var_2828:int;
      
      private var var_1654:String;
      
      private var var_2826:int;
      
      private var var_2788:Boolean;
      
      private var var_802:int;
      
      private var var_1572:int;
      
      private var var_2829:String;
      
      private var var_878:Array;
      
      private var var_2825:RoomThumbnailData;
      
      private var var_2386:Boolean;
      
      private var var_2827:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_878 = new Array();
         super();
         this.var_350 = param1.readInteger();
         this.var_763 = param1.readBoolean();
         this.var_1005 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2384 = param1.readInteger();
         this.var_2618 = param1.readInteger();
         this.var_2828 = param1.readInteger();
         this.var_1654 = param1.readString();
         this.var_2826 = param1.readInteger();
         this.var_2788 = param1.readBoolean();
         this.var_802 = param1.readInteger();
         this.var_1572 = param1.readInteger();
         this.var_2829 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_878.push(_loc4_);
            _loc3_++;
         }
         this.var_2825 = new RoomThumbnailData(param1);
         this.var_2386 = param1.readBoolean();
         this.var_2827 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_350;
      }
      
      public function get event() : Boolean
      {
         return this.var_763;
      }
      
      public function get roomName() : String
      {
         return this.var_1005;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2384;
      }
      
      public function get userCount() : int
      {
         return this.var_2618;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2828;
      }
      
      public function get description() : String
      {
         return this.var_1654;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2826;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2788;
      }
      
      public function get score() : int
      {
         return this.var_802;
      }
      
      public function get categoryId() : int
      {
         return this.var_1572;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2829;
      }
      
      public function get tags() : Array
      {
         return this.var_878;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2825;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2386;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2827;
      }
   }
}
