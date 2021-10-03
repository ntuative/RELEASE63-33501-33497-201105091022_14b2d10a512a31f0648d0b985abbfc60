package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_110:String = "me_menu_top_view";
      
      public static const const_1827:String = "me_menu_rooms_view";
      
      public static const const_359:String = "me_menu_my_clothes_view";
      
      public static const const_1193:String = "me_menu_dance_moves_view";
      
      public static const const_714:String = "me_menu_effects_view";
      
      public static const const_942:String = "me_menu_settings_view";
      
      public static const const_939:String = "me_menu_sound_settings";
      
      private static const const_1562:int = 5000;
      
      private static const const_1090:Point = new Point(95,185);
       
      
      private var var_44:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1322:Point;
      
      private var var_1610:int = 0;
      
      private var var_2891:int = 0;
      
      private var var_2890:int = 0;
      
      private var var_2889:Boolean = false;
      
      private var var_2076:int = 0;
      
      private var var_1321:Boolean = false;
      
      private var var_2888:Boolean = false;
      
      private var var_397:Boolean = false;
      
      private var var_2464:int = 0;
      
      private var var_2892:Boolean = false;
      
      private var var_2077:int = 0;
      
      private var var_1907:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1073:Boolean;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1322 = new Point(0,0);
         this._eventDispatcher = param4;
         this.var_1073 = this._config.getKey("client.toolbar.static.enabled","false") == "HabboCatalogCom_ctlg_infopage2";
         if(param5 != null && false)
         {
            this.var_2892 = param5.getKey("client.news.embed.enabled","false") == "HabboCatalogCom_ctlg_infopage2";
         }
         this.changeView(const_110);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_44 != null)
         {
            this.var_44.dispose();
            this.var_44 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_930,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_734,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_987,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_720,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_823,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_851,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_241,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_768,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_449,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_126,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_593,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_99,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_389,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_930,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_734,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_987,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_720,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_241,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_768,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_823,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_851,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_449,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_593,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_126,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_99,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_99,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:* = null;
         if(!this.var_1073)
         {
            _loc2_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_784);
            _loc2_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
         if(this.var_44 != null)
         {
            this._mainContainer.removeChild(this.var_44.window);
            this.var_44.dispose();
            this.var_44 = null;
         }
         if(this.var_1073)
         {
            this._mainContainer.visible = false;
         }
         this.var_397 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_110);
         if(this.var_1073)
         {
            this._mainContainer.position = const_1090;
            this._mainContainer.visible = true;
         }
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_914);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_397 = true;
         this._mainContainer.activate();
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_397 && this.var_44.window.name == const_359))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_826);
            if(messageListener != null)
            {
               if(!this.var_1907)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_397)
         {
            return;
         }
         if(this.var_44.window.name == const_939)
         {
            (this.var_44 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_593:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_397 + " view: " + this.var_44.window.name);
               if(this.var_397 != true || this.var_44.window.name != const_110)
               {
                  return;
               }
               (this.var_44 as MeMenuMainView).setIconAssets("clothes_icon",const_110,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_126:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               if(this.var_397)
               {
                  if(this._mainContainer != null && WindowToggle.isHiddenByOtherWindows(this._mainContainer))
                  {
                     this._mainContainer.activate();
                     return;
                  }
                  this.var_397 = false;
               }
               else
               {
                  this.var_397 = true;
               }
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_397 = false;
               break;
            default:
               return;
         }
         if(this.var_397)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1321 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1321 = true;
            }
         }
         if(this.var_44 != null && this.var_44.window.name == const_714)
         {
            (this.var_44 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_44 != null && this.var_44.window.name != const_359)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_44 != null && this.var_44.window.name == const_359)
         {
            this.changeView(const_110);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_44 != null && this.var_44.window.name == const_359)
         {
            this.changeView(const_110);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1610;
         this.var_1610 = param1.daysLeft;
         this.var_2891 = param1.periodsLeft;
         this.var_2890 = param1.pastPeriods;
         this.var_2889 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_2076);
         this.var_2076 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_44 != null)
            {
               this.changeView(this.var_44.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1321 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1321 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_2077 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_2077.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1907 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1907 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1400,HabboWindowStyle.const_1163,HabboWindowParam.const_44,new Rectangle(0,0,170,260)) as IWindowContainer;
            if(!this.var_1073)
            {
               this._mainContainer.tags.push("room_widget_me_menu");
            }
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_110:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_714:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1193:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_359:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1827:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_942:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_939:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_44 != null)
            {
               this._mainContainer.removeChild(this.var_44.window);
               this.var_44.dispose();
               this.var_44 = null;
            }
            this.var_44 = _loc2_;
            this.var_44.init(this,param1);
         }
         this.updateSize();
         if(this.var_1073 && param1 == const_110)
         {
            this.mainContainer.position = const_1090;
         }
      }
      
      public function updateSize() : void
      {
         if(this.var_44 != null)
         {
            this.var_1322.x = this.var_44.window.width + 10;
            this.var_1322.y = this.var_44.window.height;
            this.var_44.window.x = 5;
            this.var_44.window.y = 0;
            this._mainContainer.width = this.var_1322.x;
            this._mainContainer.height = this.var_1322.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2889;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1610 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1610;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2891;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2890;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_2076;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2892;
      }
      
      public function get creditBalance() : int
      {
         return this.var_2077;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2464 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2464 > const_1562;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1321;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2888;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2888 = param1;
      }
   }
}
