package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_21:Component;
      
      private var var_191:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_192:Boolean = false;
      
      private var var_1907:Boolean = false;
      
      private var var_1224:Timer;
      
      private var var_2996:int = 3000;
      
      private var var_1502:Boolean;
      
      private var var_992:Boolean;
      
      private var _blend:Number;
      
      private var var_1503:int;
      
      private var var_2995:int = 500;
      
      private var var_312:AvatarInfoData;
      
      private var var_2598:Boolean;
      
      private var var_1906:Boolean;
      
      private var var_1905:int = -1;
      
      private var var_2994:Boolean;
      
      private var var_799:AvatarInfoView;
      
      private var var_800:AvatarMenuView;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager, param5:Component)
      {
         super(param1,param2,param4);
         this.var_21 = param5;
         this.var_191 = param3;
         this.var_1502 = false;
         this.var_992 = false;
         this.var_1224 = new Timer(this.var_2996,1);
         this.var_1224.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_312 = new AvatarInfoData();
         this.var_2598 = Boolean(this.var_191.getBoolean("menu.avatar.enabled",false));
         this.var_1906 = Boolean(this.var_191.getBoolean("hover.name.enabled",false));
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_191;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_992 = true;
         this.var_1503 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_771,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_21)
         {
            this.var_21.removeUpdateReceiver(this);
            this.var_21 = null;
         }
         if(this.var_799)
         {
            this.var_799.dispose();
            this.var_799 = null;
         }
         if(this.var_800)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
         this._view = null;
         this.var_191 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_129,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_114,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_352,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_117,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_138,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_99,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_389,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_620,this.updateEventHandler);
         if(this.var_1906)
         {
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_766,this.updateEventHandler);
            param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_393,this.updateEventHandler);
         }
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_129,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_135,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_114,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_115,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_352,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_117,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_138,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_99,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_389,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_620,this.updateEventHandler);
         if(this.var_1906)
         {
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_393,this.updateEventHandler);
            param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_393,this.updateEventHandler);
         }
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_129:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_151,_loc2_.allowNameChange,null);
               this.var_192 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_620:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_33)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_151,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_115:
            case RoomWidgetFurniInfoUpdateEvent.const_352:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_135:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_766:
               if(!(this._view is AvatarMenuView))
               {
                  this.var_1905 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_946,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_393:
               if(!(this._view is AvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1905)
                  {
                     if(this._view && !this._view.allowNameChange)
                     {
                        this.removeView();
                        this.var_1905 = -1;
                     }
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_114:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_312.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_312.amIController = _loc3_.amIController;
               this.var_312.amIOwner = _loc3_.amIOwner;
               this.var_312.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_312.canBeKicked = _loc3_.canBeKicked;
               this.var_312.canTrade = _loc3_.canTrade;
               this.var_312.canTradeReason = _loc3_.canTradeReason;
               this.var_312.hasFlatControl = _loc3_.hasFlatControl;
               this.var_312.isIgnored = _loc3_.isIgnored;
               this.var_312.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_151,false,!!_loc3_.isSpectatorMode ? null : this.var_312);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_485,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_117:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_224,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_138:
               if(!this.var_192)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_185:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_99:
               this.var_1907 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_389:
               this.var_1907 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_992 = false;
         if(this.var_1224.running)
         {
            this.var_1224.stop();
         }
         var _loc7_:Boolean = param6 != null && this.var_2598;
         if(_loc7_ && !(this._view is AvatarMenuView))
         {
            this.disposeView();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4 || param5)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1907)
            {
               if(_loc7_)
               {
                  if(!this.var_800)
                  {
                     this.var_800 = new AvatarMenuView(this);
                  }
                  this._view = this.var_800;
                  AvatarMenuView.setup(this._view as AvatarMenuView,param1,param2,param3,param4,param6);
               }
               else
               {
                  if(!this.var_799)
                  {
                     this.var_799 = new AvatarInfoView(this);
                  }
                  this._view = this.var_799;
                  AvatarInfoView.setup(this._view,param1,param2,param3,param4,param5);
               }
            }
         }
         else if(this._view is AvatarMenuView)
         {
            if(this._view.userName == param2)
            {
               this.disposeView();
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            if(this.var_2994)
            {
               this._view.hide();
            }
            else
            {
               this._view.dispose();
               this.var_799 = null;
               this.var_800 = null;
            }
            this._view = null;
            this.var_1502 = true;
            this.var_992 = false;
         }
      }
      
      public function removeView() : void
      {
         if(!this.var_1502)
         {
            this.var_1502 = true;
            this.var_1224.start();
         }
         else if(!this.var_992)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_21)
         {
            return;
         }
         if(this._view)
         {
            this.var_21.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_21.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_992)
         {
            this.var_1503 += param1;
            this._blend = 1 - this.var_1503 / Number(this.var_2995);
         }
         else
         {
            this._blend = 1;
         }
         if(this._blend <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,_loc2_.screenLocation,this._blend);
      }
   }
}
