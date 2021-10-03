package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1981:String;
      
      private var var_2722:int;
      
      private var var_2723:int;
      
      private var var_1718:int;
      
      private var _id:int;
      
      private var var_1980:Boolean;
      
      private var _type:String;
      
      private var var_1978:String;
      
      private var _rewardCurrencyAmount:int;
      
      private var var_1979:String;
      
      private var var_2721:int;
      
      private var var_2724:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1981 = param1.readString();
         this.var_2722 = param1.readInteger();
         this.var_2723 = param1.readInteger();
         this.var_1718 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1980 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1978 = param1.readString();
         this._rewardCurrencyAmount = param1.readInteger();
         this.var_1979 = param1.readString();
         this.var_2721 = param1.readInteger();
         this.var_2724 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1978 = "";
         this._rewardCurrencyAmount = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1981;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1979;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2722;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2723;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1718;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1980;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_1978;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this._rewardCurrencyAmount;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2721;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2724;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1981;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_1979;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1980 = param1;
      }
   }
}
