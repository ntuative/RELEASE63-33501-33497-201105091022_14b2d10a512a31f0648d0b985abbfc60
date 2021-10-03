package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1500:int;
      
      private var var_2025:int;
      
      private var var_2597:int;
      
      private var var_1900:int;
      
      private var var_1499:int;
      
      private var var_2582:String = "";
      
      private var var_2941:String = "";
      
      private var var_2942:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1500 = param1.readInteger();
         this.var_2582 = param1.readString();
         this.var_2025 = param1.readInteger();
         this.var_2597 = param1.readInteger();
         this.var_1900 = param1.readInteger();
         this.var_1499 = param1.readInteger();
         this.var_2942 = param1.readInteger();
         this.var_2941 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1500;
      }
      
      public function get points() : int
      {
         return this.var_2025;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2597;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1900;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1499;
      }
      
      public function get badgeID() : String
      {
         return this.var_2582;
      }
      
      public function get achievementID() : int
      {
         return this.var_2942;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2941;
      }
   }
}
