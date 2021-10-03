package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1500:int;
      
      private var var_311:String;
      
      private var var_2622:int;
      
      private var var_2597:int;
      
      private var var_1900:int;
      
      private var var_2621:int;
      
      private var var_2619:Boolean;
      
      private var _category:String;
      
      private var var_2620:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1500 = param1.readInteger();
         this.var_311 = param1.readString();
         this.var_2622 = param1.readInteger();
         this.var_2597 = param1.readInteger();
         this.var_1900 = param1.readInteger();
         this.var_2621 = param1.readInteger();
         this.var_2619 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2620 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_311;
      }
      
      public function get level() : int
      {
         return this.var_1500;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2622;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2597;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1900;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2621;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_2619;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2620;
      }
   }
}
