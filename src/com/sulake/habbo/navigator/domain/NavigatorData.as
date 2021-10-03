package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1926:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_208:MsgWithRequestId;
      
      private var var_662:RoomEventData;
      
      private var var_2749:Boolean;
      
      private var var_2741:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2449:int;
      
      private var var_269:GuestRoomData;
      
      private var var_1034:PublicRoomShortData;
      
      private var var_2740:int;
      
      private var var_2748:Boolean;
      
      private var var_2746:int;
      
      private var var_2747:Boolean;
      
      private var var_1992:int;
      
      private var var_2743:Boolean;
      
      private var var_1469:Array;
      
      private var var_1557:Array;
      
      private var var_2744:int;
      
      private var var_1558:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1276:Boolean;
      
      private var var_2742:int;
      
      private var var_2745:Boolean;
      
      private var var_2739:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1469 = new Array();
         this.var_1557 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_269 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_269 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1034 = null;
         this.var_269 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1034 = param1.publicSpace;
            this.var_662 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_662 != null)
         {
            this.var_662.dispose();
            this.var_662 = null;
         }
         if(this.var_1034 != null)
         {
            this.var_1034.dispose();
            this.var_1034 = null;
         }
         if(this.var_269 != null)
         {
            this.var_269.dispose();
            this.var_269 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_269 != null)
         {
            this.var_269.dispose();
         }
         this.var_269 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_662 != null)
         {
            this.var_662.dispose();
         }
         this.var_662 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_208 != null && this.var_208 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_208 != null && this.var_208 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_208 != null && this.var_208 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_208 = param1;
         this.var_1276 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_208 = param1;
         this.var_1276 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_208 = param1;
         this.var_1276 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_208 == null)
         {
            return;
         }
         this.var_208.dispose();
         this.var_208 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_208 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_208 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_208 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_662;
      }
      
      public function get avatarId() : int
      {
         return this.var_2449;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2749;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2741;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_269;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1034;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2748;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2746;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1992;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2747;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2742;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2740;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2743;
      }
      
      public function get adIndex() : int
      {
         return this.var_2739;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2745;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2449 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2746 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2748 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2749 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2741 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2747 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1992 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2742 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2740 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2743 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2739 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2745 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1469 = param1;
         this.var_1557 = new Array();
         for each(_loc2_ in this.var_1469)
         {
            if(_loc2_.visible)
            {
               this.var_1557.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1469;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1557;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2744 = param1.limit;
         this.var_1558 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1558 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_269.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_269 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_269.flatId;
         return this.var_1992 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1558 >= this.var_2744;
      }
      
      public function startLoading() : void
      {
         this.var_1276 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1276;
      }
   }
}
