package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1126:int = 1;
      
      public static const const_836:int = 2;
      
      public static const const_775:int = 3;
      
      public static const const_1793:int = 4;
       
      
      private var _index:int;
      
      private var var_2646:String;
      
      private var var_2649:String;
      
      private var var_2648:Boolean;
      
      private var var_2645:String;
      
      private var var_901:String;
      
      private var var_2647:int;
      
      private var var_2618:int;
      
      private var _type:int;
      
      private var var_2184:String;
      
      private var var_1007:GuestRoomData;
      
      private var var_1006:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2646 = param1.readString();
         this.var_2649 = param1.readString();
         this.var_2648 = param1.readInteger() == 1;
         this.var_2645 = param1.readString();
         this.var_901 = param1.readString();
         this.var_2647 = param1.readInteger();
         this.var_2618 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1126)
         {
            this.var_2184 = param1.readString();
         }
         else if(this._type == const_775)
         {
            this.var_1006 = new PublicRoomData(param1);
         }
         else if(this._type == const_836)
         {
            this.var_1007 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1007 != null)
         {
            this.var_1007.dispose();
            this.var_1007 = null;
         }
         if(this.var_1006 != null)
         {
            this.var_1006.dispose();
            this.var_1006 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2646;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2649;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2648;
      }
      
      public function get picText() : String
      {
         return this.var_2645;
      }
      
      public function get picRef() : String
      {
         return this.var_901;
      }
      
      public function get folderId() : int
      {
         return this.var_2647;
      }
      
      public function get tag() : String
      {
         return this.var_2184;
      }
      
      public function get userCount() : int
      {
         return this.var_2618;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1007;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1006;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1126)
         {
            return 0;
         }
         if(this.type == const_836)
         {
            return this.var_1007.maxUserCount;
         }
         if(this.type == const_775)
         {
            return this.var_1006.maxUsers;
         }
         return 0;
      }
   }
}
