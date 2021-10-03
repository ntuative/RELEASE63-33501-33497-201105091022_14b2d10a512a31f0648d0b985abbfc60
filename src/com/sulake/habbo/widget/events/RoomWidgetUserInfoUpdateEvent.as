package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_135:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_114:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_733:int = 2;
      
      public static const const_735:int = 3;
      
      public static const const_1650:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1742:String = "";
      
      private var var_2189:int;
      
      private var var_2257:int = 0;
      
      private var var_2262:int = 0;
      
      private var var_614:String = "";
      
      private var var_45:BitmapData = null;
      
      private var var_258:Array;
      
      private var var_1371:int = 0;
      
      private var var_2259:String = "";
      
      private var var_2252:int = 0;
      
      private var var_2264:int = 0;
      
      private var var_1934:Boolean = false;
      
      private var var_1743:String = "";
      
      private var var_2258:Boolean = false;
      
      private var var_2251:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2263:Boolean = false;
      
      private var var_2253:Boolean = false;
      
      private var var_2254:Boolean = false;
      
      private var var_2261:Boolean = false;
      
      private var var_2255:Boolean = false;
      
      private var var_2256:Boolean = false;
      
      private var var_2260:int = 0;
      
      private var var_1935:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_258 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1742 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1742;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2189;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2257 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2257;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2262 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2262;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_614 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_45 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_258 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_258;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1371 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1371;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2259 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2259;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2258 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2258;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2263 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2263;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2253 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2253;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2254 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2254;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2261 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2261;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2255 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2255;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2256 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2256;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2260 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2260;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2251 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2251;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1935 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1935;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2252 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2252;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2264 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2264;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1934 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1934;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1743 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1743;
      }
   }
}
