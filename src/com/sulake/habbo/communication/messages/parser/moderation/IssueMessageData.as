package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_173:int = 1;
      
      public static const const_412:int = 2;
      
      public static const const_1794:int = 3;
       
      
      private var var_2561:int;
      
      private var _state:int;
      
      private var var_1572:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1885:int;
      
      private var _priority:int;
      
      private var var_2556:int = 0;
      
      private var var_2557:int;
      
      private var var_2555:String;
      
      private var var_1447:int;
      
      private var var_1775:String;
      
      private var var_2501:int;
      
      private var var_2554:String;
      
      private var _message:String;
      
      private var var_2408:int;
      
      private var var_1005:String;
      
      private var var_1548:int;
      
      private var var_2558:String;
      
      private var var_350:int;
      
      private var var_2560:String;
      
      private var var_2559:String;
      
      private var var_2199:int;
      
      private var var_2200:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2561 = param1;
         this._state = param2;
         this.var_1572 = param3;
         this._reportedCategoryId = param4;
         this.var_1885 = param5;
         this._priority = param6;
         this.var_2557 = param7;
         this.var_2555 = param8;
         this.var_1447 = param9;
         this.var_1775 = param10;
         this.var_2501 = param11;
         this.var_2554 = param12;
         this._message = param13;
         this.var_2408 = param14;
         this.var_1005 = param15;
         this.var_1548 = param16;
         this.var_2558 = param17;
         this.var_350 = param18;
         this.var_2560 = param19;
         this.var_2559 = param20;
         this.var_2199 = param21;
         this.var_2200 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2561;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1572;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1885;
      }
      
      public function get priority() : int
      {
         return this._priority + this.var_2556;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2557;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2555;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1447;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1775;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2501;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2554;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2408;
      }
      
      public function get roomName() : String
      {
         return this.var_1005;
      }
      
      public function get roomType() : int
      {
         return this.var_1548;
      }
      
      public function get flatType() : String
      {
         return this.var_2558;
      }
      
      public function get flatId() : int
      {
         return this.var_350;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2560;
      }
      
      public function get roomResources() : String
      {
         return this.var_2559;
      }
      
      public function get unitPort() : int
      {
         return this.var_2199;
      }
      
      public function get worldId() : int
      {
         return this.var_2200;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2556 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1885) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
