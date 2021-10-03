package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_259:IHabboCommunicationManager;
      
      private var var_1063:IHabboLocalizationManager;
      
      private var var_845:IHabboConfigurationManager;
      
      private var var_379:ISessionDataManager;
      
      private var var_1304:FaqIndex;
      
      private var var_1540:IncomingMessages;
      
      private var var_65:HelpUI;
      
      private var var_104:TutorialUI;
      
      private var var_846:HotelMergeUI;
      
      private var var_1586:CallForHelpData;
      
      private var var_2824:UserRegistry;
      
      private var var_2318:String = "";
      
      private var var_1064:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1586 = new CallForHelpData();
         this.var_2824 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1304 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2318 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2318;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1586;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2824;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_1063;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_379;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_104;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_846;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_104)
         {
            return this.var_104.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.dispose();
            this.var_65 = null;
         }
         if(this.var_104 != null)
         {
            this.var_104.dispose();
            this.var_104 = null;
         }
         if(this.var_846)
         {
            this.var_846.dispose();
            this.var_846 = null;
         }
         if(this.var_1304 != null)
         {
            this.var_1304.dispose();
            this.var_1304 = null;
         }
         this.var_1540 = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_1063)
         {
            this.var_1063.release(new IIDHabboLocalizationManager());
            this.var_1063 = null;
         }
         if(this.var_259)
         {
            this.var_259.release(new IIDHabboCommunicationManager());
            this.var_259 = null;
         }
         if(this.var_845)
         {
            this.var_845.release(new IIDHabboConfigurationManager());
            this.var_845 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_379 != null)
         {
            this.var_379.release(new IIDSessionDataManager());
            this.var_379 = null;
         }
         if(this.var_1064 != null)
         {
            this.var_1064.dispose();
            this.var_1064 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1304;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_259 != null && param1 != null)
         {
            this.var_259.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_845 == null)
         {
            return param1;
         }
         return this.var_845.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1586.reportedUserId = param1;
         this.var_1586.reportedUserName = param2;
         this.var_65.showUI(HabboHelpViewEnum.const_381);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_65 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_65.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_65 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_65 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_1063,this._toolbar);
         }
         return this.var_65 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_104 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_104 = new TutorialUI(this,_loc1_);
         }
         return this.var_104 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_104 != null)
         {
            this.var_104.dispose();
            this.var_104 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_846)
         {
            this.var_846 = new HotelMergeUI(this);
         }
         this.var_846.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_104 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_104.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_104)
         {
            this.var_104.showView(TutorialUI.const_317);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_259 = IHabboCommunicationManager(param2);
         this.var_1540 = new IncomingMessages(this,this.var_259);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_1063 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_845 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_85,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_95,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_73,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_35,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_379 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_85:
               if(this.var_65 != null)
               {
                  this.var_65.setRoomSessionStatus(true);
               }
               if(this.var_104 != null)
               {
                  this.var_104.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_95:
               if(this.var_65 != null)
               {
                  this.var_65.setRoomSessionStatus(false);
               }
               if(this.var_104 != null)
               {
                  this.var_104.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function showWelcomeScreen(param1:WelcomeNotification) : void
      {
         if(!this.var_1064)
         {
            this.var_1064 = new WelcomeScreenController(this,this._windowManager,this.var_845);
         }
         this.var_1064.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this._toolbar != null)
         {
            this._toolbar.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_130,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_73)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_35)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
   }
}
