package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSongUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1934:String = "infostand_user_view";
      
      private const const_1930:String = "infostand_furni_view";
      
      private const const_1935:String = "infostand_pet_view";
      
      private const const_1931:String = "infostand_bot_view";
      
      private const const_1932:String = "infostand_jukebox_view";
      
      private const const_1933:String = "infostand_songdisk_view";
      
      private var var_1316:InfoStandFurniView;
      
      private var var_188:InfoStandUserView;
      
      private var var_396:InfoStandPetView;
      
      private var var_474:InfoStandBotView;
      
      private var var_1069:InfoStandJukeboxView;
      
      private var var_1070:InfoStandSongDiskView;
      
      private var var_2874:Array;
      
      private var var_1603:InfostandUserData;
      
      private var var_660:InfostandFurniData;
      
      private var _petData:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_167:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private const const_2202:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1316 = new InfoStandFurniView(this,this.const_1930,this._catalog);
         this.var_188 = new InfoStandUserView(this,this.const_1934);
         this.var_396 = new InfoStandPetView(this,this.const_1935,this._catalog);
         this.var_474 = new InfoStandBotView(this,this.const_1931);
         this.var_1069 = new InfoStandJukeboxView(this,this.const_1932,this._catalog);
         this.var_1070 = new InfoStandSongDiskView(this,this.const_1933,this._catalog);
         this.var_1603 = new InfostandUserData();
         this.var_660 = new InfostandFurniData();
         this._petData = new InfoStandPetData();
         this.var_167 = new Timer(this.const_2202);
         this.var_167.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_68,HabboWindowStyle.const_44,HabboWindowParam.const_44,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
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
            window = windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
            Logger.log("[InfoStandWidget] Missing window XML: " + name);
         }
         return window;
      }
      
      override public function dispose() : void
      {
         if(this.var_167)
         {
            this.var_167.stop();
         }
         this.var_167 = null;
         if(this.var_188)
         {
            this.var_188.dispose();
         }
         this.var_188 = null;
         if(this.var_1316)
         {
            this.var_1316.dispose();
         }
         this.var_1316 = null;
         if(this.var_474)
         {
            this.var_474.dispose();
         }
         this.var_474 = null;
         if(this.var_396)
         {
            this.var_396.dispose();
         }
         this.var_396 = null;
         if(this.var_1069)
         {
            this.var_1069.dispose();
         }
         this.var_1069 = null;
         if(this.var_1070)
         {
            this.var_1070.dispose();
         }
         this.var_1070 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_280,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_140,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_114,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_352,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_191,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_186,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_142,this.onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_813,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_117,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         param1.addEventListener(RoomWidgetSongUpdateEvent.const_384,this.onSongUpdate);
         param1.addEventListener(RoomWidgetSongUpdateEvent.const_388,this.onSongUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_280,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_140,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_114,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_352,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_191,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_186,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_142,this.onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_813,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_117,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         param1.removeEventListener(RoomWidgetSongUpdateEvent.const_384,this.onSongUpdate);
         param1.removeEventListener(RoomWidgetSongUpdateEvent.const_388,this.onSongUpdate);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1603;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_660;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this._petData;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_396 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_432,this.var_396.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_188.update(param1);
         this.selectView(this.const_1934);
         if(this.var_167)
         {
            this.var_167.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_474.update(param1);
         this.selectView(this.const_1931);
         if(this.var_167)
         {
            this.var_167.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         if(param1.extraParam == RoomWidgetInfostandExtraParamEnum.const_552)
         {
            this.var_1069.update(param1);
            this.selectView(this.const_1932);
         }
         else if(param1.extraParam.indexOf(RoomWidgetInfostandExtraParamEnum.const_418) != -1)
         {
            this.var_1070.update(param1);
            this.selectView(this.const_1933);
         }
         else
         {
            this.var_1316.update(param1);
            this.selectView(this.const_1930);
         }
         if(this.var_167)
         {
            this.var_167.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_396.update(this.petData);
         this.selectView(this.const_1935);
         if(this.var_167)
         {
            this.var_167.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_396.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2874 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_188.setTags(param1.tags);
         }
         else
         {
            this.var_188.setTags(param1.tags,this.var_2874);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_474.image = param1.image;
         }
         else
         {
            this.var_188.image = param1.image;
            this.var_188.setMotto(param1.customInfo,param1.isOwnUser);
            this.var_188.achievementScore = param1.achievementScore;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_188.clearBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_474.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_188.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_188.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_366,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_140:
               _loc2_ = param1.id == this.var_660.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_185:
               if(this.var_188 != null && this.var_188.window != null && this.var_188.window.visible)
               {
                  _loc2_ = param1.id == this.var_1603.userRoomId;
                  break;
               }
               if(this.var_396 != null && this.var_396.window != null && this.var_396.window.visible)
               {
                  _loc2_ = param1.id == this._petData.roomIndex;
                  break;
               }
               if(this.var_474 != null && this.var_474.window != null && this.var_474.window.visible)
               {
                  _loc2_ = param1.id == this.var_1603.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      private function onSongUpdate(param1:RoomWidgetSongUpdateEvent) : void
      {
         this.var_1069.updateSongInfo(param1);
         this.var_1070.updateSongInfo(param1);
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_167)
         {
            this.var_167.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_167)
         {
            this.var_167.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
