package com.sulake.habbo.quest
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class HabboQuestEngine extends Component implements IHabboQuestEngine
   {
      
      private static const const_1404:Array = ["MOVEITEM","ENTEROTHERSROOM","CHANGEFIGURE","FINDLIFEGUARDTOWER"];
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_191:IHabboConfigurationManager;
      
      private var var_1540:IncomingMessages;
      
      private var var_1141:QuestController;
      
      private var var_1734:AchievementController;
      
      private var _toolbar:IHabboToolbar;
      
      private var _catalog:IHabboCatalog;
      
      private var var_942:IHabboNotifications;
      
      private var var_379:ISessionDataManager;
      
      private var var_2312:String;
      
      private var var_1142:IHabboHelp;
      
      public function HabboQuestEngine(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_1141 = new QuestController(this);
         this.var_1734 = new AchievementController(this);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         registerUpdateReceiver(this.var_1141,3);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this.var_942 != null)
         {
            this.var_942.release(new IIDHabboNotifications());
            this.var_942 = null;
         }
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_191 != null)
         {
            this.var_191.release(new IIDHabboConfigurationManager());
            this.var_191 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_379 != null)
         {
            this.var_379.release(new IIDSessionDataManager());
            this.var_379 = null;
         }
         if(this.var_1540)
         {
            this.var_1540.dispose();
         }
         if(this.var_1142 != null)
         {
            this.var_1142.release(new IIDHabboHelp());
            this.var_1142 = null;
         }
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = this._windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
         }
         return window;
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = IHabboCommunicationManager(param2);
         this.var_1540 = new IncomingMessages(this);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = IHabboLocalizationManager(param2);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_191 = param2 as IHabboConfigurationManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_942 = param2 as IHabboNotifications;
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_379 = param2 as ISessionDataManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1142 = param2 as IHabboHelp;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return this.var_1142;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_191;
      }
      
      public function get questController() : QuestController
      {
         return this.var_1141;
      }
      
      public function get achievementController() : AchievementController
      {
         return this.var_1734;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function openCatalog(param1:QuestMessageData) : void
      {
         var _loc2_:String = "catalog.page.quest." + param1.campaignCode;
         Logger.log("Questing->Open Catalog: " + _loc2_);
         this._catalog.openCatalogPage(_loc2_,true);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2) as IHabboToolbar;
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_35,this.onHabboToolbarEvent);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_35)
         {
            if(param1.iconId == HabboToolbarIconEnum.QUESTS)
            {
               this.var_1141.onToolbarClick();
            }
            if(param1.iconId == HabboToolbarIconEnum.ACHIEVEMENTS)
            {
               this.var_1734.onToolbarClick();
            }
         }
      }
      
      public function get notifications() : IHabboNotifications
      {
         return this.var_942;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_379;
      }
      
      public function get defaultCampaignCode() : String
      {
         return this.var_2312;
      }
      
      public function set defaultCampaignCode(param1:String) : void
      {
         this.var_2312 = param1;
      }
      
      public function send(param1:IMessageComposer) : void
      {
         this.communication.getHabboMainConnection(null).send(param1);
      }
      
      public function isTrackerVisible() : Boolean
      {
         return this.var_1141.questTracker.isVisible();
      }
      
      public function getQuestRowTitle(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestName(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestDesc(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".desc";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getQuestHint(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getQuestLocalizationKey() + ".hint";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getCampaignName(param1:QuestMessageData) : String
      {
         var _loc2_:* = param1.getCampaignLocalizationKey() + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function getAchievementCategoryName(param1:AchievementCategory) : String
      {
         var _loc2_:* = "quests." + param1.code + ".name";
         return this._localization.getKey(_loc2_,_loc2_);
      }
      
      public function setupQuestImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("quest_pic_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh quest image...");
            return;
         }
         var _loc4_:String = !!this.isQuestWithPrompts(param2) ? "_a" : "";
         _loc3_.id = param2.id;
         new PendingImage(this,_loc3_,(param2.campaignCode + "_" + param2.localizationCode + param2.imageVersion + _loc4_).toLowerCase());
      }
      
      public function setupPromptFrameImage(param1:IWindowContainer, param2:QuestMessageData, param3:String) : void
      {
         var _loc4_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("prompt_pic_" + param3));
         if(_loc4_.id == param2.id)
         {
            Logger.log("No need to refresh prompt image...");
            return;
         }
         _loc4_.id = param2.id;
         new PendingImage(this,_loc4_,(param2.campaignCode + "_" + param2.localizationCode + param2.imageVersion + "_" + param3).toLowerCase());
      }
      
      public function setupRewardImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("currency_bitmap"));
         if(_loc3_.id == param2.id)
         {
            Logger.log("No need to refresh reward image...");
            return;
         }
         _loc3_.id = param2.id;
         new PendingImage(this,_loc3_,"quest_pixel");
      }
      
      public function setupCampaignImage(param1:IWindowContainer, param2:QuestMessageData) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("campaign_pic_bitmap"));
         if(_loc3_.tags[0] == param2.campaignCode)
         {
            Logger.log("No need to refresh campaign image...");
            return;
         }
         _loc3_.tags[0] = param2.campaignCode;
         new PendingImage(this,_loc3_,param2.campaignCode);
      }
      
      public function setupAchievementCategoryImage(param1:IWindowContainer, param2:AchievementCategory) : void
      {
         var _loc3_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName("category_pic_bitmap"));
         if(_loc3_.tags[0] == param2.code)
         {
            Logger.log("No need to refresh category image...");
            return;
         }
         _loc3_.tags[0] = param2.code;
         new PendingImage(this,_loc3_,param2.code);
      }
      
      public function isQuestingEnabled() : Boolean
      {
         return this.var_191.getKey("questing.enabled","false") == "HabboCatalogCom_ctlg_infopage2";
      }
      
      public function isQuestWithPrompts(param1:QuestMessageData) : Boolean
      {
         return const_1404.indexOf(param1.localizationCode) > -1;
      }
   }
}
