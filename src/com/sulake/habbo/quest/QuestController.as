package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_701:QuestsList;
      
      private var var_567:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_401:QuestTracker;
      
      private var var_1080:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_401 = new QuestTracker(this._questEngine);
         this.var_701 = new QuestsList(this._questEngine);
         this.var_567 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_1080 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_701.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_701.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_401.onQuest(param1);
         this.var_567.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_401.onQuestCompleted(param1);
         this.var_567.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_401.onQuestCancelled();
         this.var_567.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_401.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_701.onRoomExit();
         this.var_401.onRoomExit();
         this.var_567.onRoomExit();
         this.var_1080.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_401.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_701)
         {
            this.var_701.dispose();
            this.var_701 = null;
         }
         if(this.var_401)
         {
            this.var_401.dispose();
            this.var_401 = null;
         }
         if(this.var_567)
         {
            this.var_567.dispose();
            this.var_567 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_1080)
         {
            this.var_1080.dispose();
            this.var_1080 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_701;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_567;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_401;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_1080;
      }
   }
}
