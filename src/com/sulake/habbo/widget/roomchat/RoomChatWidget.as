package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.quest.IHabboQuestEngine;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_120:int = 18;
      
      private static const const_1541:int = 9;
      
      private static const const_1074:int = 10;
      
      private static const const_681:int = 25;
      
      private static const const_1416:int = 25;
      
      private static const const_1076:int = 4000;
      
      private static const const_1543:int = 6000;
      
      private static const const_1545:int = 3;
      
      private static const const_1546:int = 1;
      
      private static const const_680:int = 8;
      
      private static const const_468:int = 0;
      
      private static const const_1075:int = (const_680 + const_468) * const_120 + const_120;
      
      private static const const_467:int = 9;
      
      private static const const_1544:int = 200;
      
      private static const const_1542:int = 40;
       
      
      private var var_1291:int = 0;
      
      private var var_1056:int = 0;
      
      private var var_41:IWindowContainer;
      
      private var var_392:IItemListWindow;
      
      private var var_121:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_69:Array;
      
      private var var_272:Array;
      
      private var var_2796:int;
      
      private var var_2798:int = 0;
      
      private var var_840:Number = 1;
      
      private var var_2795:String;
      
      private var var_1055:Number = 1;
      
      private var var_2024:Number = 0;
      
      private var var_841:Point;
      
      private var var_27:RoomChatHistoryViewer;
      
      private var var_961:Boolean = false;
      
      private var var_2023:Boolean = false;
      
      private var var_21:Component = null;
      
      private var _questEngine:IHabboQuestEngine;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_2794:int = 150;
      
      private var var_229:int = 171.0;
      
      private var var_1054:int = 18;
      
      private var var_2797:int;
      
      private var var_2793:int;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component, param7:IHabboQuestEngine)
      {
         this._itemList = new Array();
         this.var_69 = new Array();
         this.var_272 = new Array();
         this.var_841 = new Point();
         super(param1,param2,param3);
         this._questEngine = param7;
         this._config = param4;
         this.var_2796 = param5;
         this.var_41 = param1.createWindow("chat_container","",HabboWindowType.const_68,HabboWindowStyle.const_30,HabboWindowParam.const_44,new Rectangle(0,0,200,this.var_229 + RoomChatHistoryPulldown.const_86),null,0) as IWindowContainer;
         this.var_41.background = true;
         this.var_41.color = 33554431;
         this.var_41.tags.push("room_widget_chat");
         this.var_392 = param1.createWindow("chat_contentlist","",HabboWindowType.const_1310,HabboWindowStyle.const_44,0 | 0,new Rectangle(0,0,200,this.var_229),null,0) as IItemListWindow;
         this.var_41.addChild(this.var_392);
         this.var_121 = param1.createWindow("chat_active_content","",HabboWindowType.const_68,HabboWindowStyle.const_44,HabboWindowParam.const_62,new Rectangle(0,0,200,this.var_229),null,0) as IWindowContainer;
         this.var_121.clipping = false;
         this.var_392.addListItem(this.var_121);
         this.var_27 = new RoomChatHistoryViewer(this,param1,this.var_41,param2);
         this.var_2795 = param4.getKey("site.url");
         this.var_2794 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc8_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         this.var_2797 = param4.getKey("client.toolbar.static.enabled") == "HabboCatalogCom_ctlg_infopage2" ? 100 : 0;
         if(this.var_27 != null)
         {
            this.var_27.disabled = _loc8_;
         }
         if(param6 != null)
         {
            this.var_21 = param6;
            this.var_21.registerUpdateReceiver(this,1);
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_41;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         while(this.var_272.length > 0)
         {
            _loc1_ = this.var_272.shift();
         }
         this.var_27.dispose();
         this.var_27 = null;
         while(this._itemList.length > 0)
         {
            _loc1_ = this._itemList.shift();
            _loc1_.dispose();
         }
         while(this.var_69.length > 0)
         {
            _loc1_ = this.var_69.shift();
            _loc1_.dispose();
         }
         this.var_41.dispose();
         if(this.var_21 != null)
         {
            this.var_21.removeUpdateReceiver(this);
            this.var_21 = null;
         }
         this._questEngine = null;
         super.dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > this.var_1291 && this.var_1291 > 0)
         {
            this.var_1291 = -1;
            this.animationStart();
         }
         if(this.var_961)
         {
            _loc2_ = param1 / const_1416 * const_1545;
            if(_loc2_ + this.var_1056 > this.var_1054)
            {
               _loc2_ = this.var_1054 - this.var_1056;
            }
            if(_loc2_ > 0)
            {
               this.moveItemsUp(_loc2_);
               this.var_1056 += _loc2_;
            }
            if(this.var_1056 >= this.var_1054)
            {
               this.var_1054 = const_120;
               this.var_1056 = 0;
               this.animationStop();
               this.processBuffer();
               this.var_1291 = getTimer() + const_1076;
            }
         }
         if(this.var_27 != null)
         {
            this.var_27.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_900,this.onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_361,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_699,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_703,this.onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_900,this.onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_361,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_699,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_703,this.onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,this.getFreeItemId(),localizations,this.var_2795);
         _loc2_.define(param1);
         if(this.var_1055 != 1)
         {
            _loc2_.senderX /= this.var_1055;
         }
         _loc2_.senderX -= this.var_841.x;
         this.setChatItemLocHorizontal(_loc2_);
         this.var_69.push(_loc2_);
         this.processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(this.var_2024 == 0)
            {
               this.var_2024 = param1.scale;
            }
            else
            {
               this.var_1055 = param1.scale / this.var_2024;
            }
         }
         if(param1.positionDelta != null)
         {
            this.var_841.x += param1.positionDelta.x / this.var_1055;
            this.var_841.y += param1.positionDelta.y / this.var_1055;
         }
         if(param1.rect != null)
         {
            if(this.var_27 == null)
            {
               return;
            }
            this.var_41.width = _loc2_.width;
            this.var_41.height = this.var_229 + this.var_27.pulldownBarHeight;
            this.var_392.width = this.var_41.width - this.var_27.scrollbarWidth;
            this.var_392.height = this.var_229;
            this.var_392.x = this.var_41.x;
            this.var_392.y = this.var_41.y;
            this.var_121.width = this.var_41.width - this.var_27.scrollbarWidth;
            this.var_121.height = this.var_229;
            if(this.historyViewerActive())
            {
               this.reAlignItemsToHistoryContent();
            }
            this.var_27.containerResized(this.var_41.rectangle,true);
         }
         this.alignItems();
      }
      
      private function processBuffer() : void
      {
         if(this.var_961)
         {
            return;
         }
         if(this.var_69.length == 0)
         {
            return;
         }
         while(this.var_69.length > const_1546 || this.historyViewerActive() && this.var_69.length > 0)
         {
            this.activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(this._itemList.length == 0)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.checkLastItemAllowsAdding(this.var_69[0]);
         }
         if(_loc1_)
         {
            this.activateItemFromBuffer();
            this.var_1291 = getTimer() + const_1076;
         }
         else
         {
            if(this._itemList.length > 0 && this.var_69.length > 0)
            {
               this.var_1054 = this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_69[0]);
            }
            else
            {
               this.var_1054 = const_120;
            }
            this.animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_69.length == 0)
         {
            return;
         }
         if(this.historyViewerMinimized())
         {
            this.resetArea();
            this.hideHistoryViewer();
         }
         if(!this.checkLastItemAllowsAdding(this.var_69[0]))
         {
            this.selectItemsToMove();
            this.moveItemsUp(this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_69[0]));
            if(!this.checkLastItemAllowsAdding(this.var_69[0]))
            {
               this.var_121.height += const_120;
               if(this.var_27 != null)
               {
                  this.var_27.containerResized(this.var_41.rectangle);
               }
            }
         }
         _loc1_ = this.var_69.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               this.var_121.addChild(_loc2_);
               _loc1_.timeStamp = new Date().time;
               this._itemList.push(_loc1_);
               _loc3_ = 0;
               if(this._itemList.length > 1)
               {
                  _loc3_ = this._itemList[this._itemList.length - 2].screenLevel;
                  if(this.historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(this.var_840,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = this.var_840;
               if(_loc1_.aboveLevels > const_680 + const_468 + 2)
               {
                  _loc1_.aboveLevels = const_680 + const_468 + 2;
               }
               this.var_840 = 0;
               this.setChatItemLocHorizontal(_loc1_);
               this.setChatItemLocVertical(_loc1_);
               this.setChatItemRenderable(_loc1_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(this._itemList.length == 0)
         {
            return true;
         }
         var _loc2_:RoomChatItem = this._itemList[this._itemList.length - 1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(this.var_121.rectangle.bottom - (this.var_121.y + _loc2_.y + _loc2_.height) <= this.getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_27 == null)
         {
            return;
         }
         _loc1_ = this._itemList.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
               this.setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.var_69.length)
         {
            _loc2_ = this.var_69[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function animationStart() : void
      {
         if(this.var_961)
         {
            return;
         }
         this.selectItemsToMove();
         this.var_961 = true;
      }
      
      private function animationStop() : void
      {
         this.var_961 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(this.var_961)
         {
            return;
         }
         this.purgeItems();
         this.var_272 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(this._itemList.length == 0)
         {
            this.var_840 = 1;
            return;
         }
         if(this.historyViewerActive())
         {
            return;
         }
         ++this.var_840;
         var _loc3_:int = this._itemList.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this._itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_468 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timeStamp >= const_1543)
               {
                  _loc4_.timeStamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  this.var_272.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_272 == null)
         {
            return;
         }
         if(this.var_272.length == 0)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = this.var_272.length - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = this.var_272[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = this._itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(this.historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(this._itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - this._itemList[_loc4_ - 1].y < this.getItemSpacing(this._itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || this.var_27 == null)
         {
            return;
         }
         this.var_2793 = !!this._questEngine.isTrackerVisible() ? int(const_1544) : 0;
         var _loc2_:Number = (param1.senderX + this.var_841.x) * this.var_1055;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = -this.var_41.width / 2 - const_1074 + this.var_2797;
         var _loc6_:Number = this.var_41.width / 2 + const_1074 - this.var_27.scrollbarWidth - this.var_2793;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + this.var_41.width / 2 + this.var_41.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = this._itemList.indexOf(param1);
            _loc3_ = !!this.historyViewerActive() ? 0 : Number(this.var_840);
            if(_loc2_ == this._itemList.length - 1)
            {
               param1.y = this.getAreaBottom() - (_loc3_ + 1) * const_120 - const_467;
            }
            else
            {
               _loc4_ = this._itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = this._itemList[_loc2_ + 1].y - this.getItemSpacing(param1,this._itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = this._itemList[_loc2_ + 1].y - _loc4_ * const_120;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_681)
            {
               if(param1.view != null)
               {
                  this.var_121.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  this.var_121.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_120;
               }
               else
               {
                  _loc2_ += this.getItemSpacing(this._itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_120;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(this.historyViewerActive())
         {
            return this.var_121.height;
         }
         return this.var_229 + this.var_41.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_120;
         }
         return const_1541;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(this.historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(this._itemList.length > this.var_2794)
         {
            _loc2_ = this._itemList.shift();
            _loc3_ = this.var_272.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               this.var_272.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               this.var_121.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < this._itemList.length; _loc1_++)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_681)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = this.var_272.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     this.var_272.splice(_loc3_,1);
                  }
                  this.var_121.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(this.var_69.length > 0)
         {
            _loc4_ = true;
         }
         if(this.getTotalContentHeight() > const_120 && !_loc4_ && !this.historyViewerActive())
         {
            if(this.var_27 != null)
            {
               this.stretchAreaBottomTo(this.var_41.y);
               this.alignItems();
               if(!this.historyViewerActive())
               {
                  this.var_27.showHistoryViewer();
               }
               if(!this.historyViewerVisible())
               {
                  this.var_27.visible = true;
               }
            }
         }
         else if(this.historyViewerVisible())
         {
            this.var_27.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + this.var_2796.toString() + "_item_" + (this.var_2798++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(this.var_27 != null)
            {
               this.var_27.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_366,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_950,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(this.historyViewerVisible())
         {
            return;
         }
         if(this.var_27 != null)
         {
            this.var_27.beginDrag(param5.stageY);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this.var_27 != null)
         {
            this.var_27.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this.var_27 != null)
         {
            this.var_27.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = this.var_41.rectangle.bottom + param1 - 0;
         this.stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = this.var_41.context.getDesktopWindow().height - 0 - const_1542;
         param1 = Math.min(param1,_loc2_);
         this.var_229 = param1 - this.var_41.y;
         this.var_41.height = this.var_229 + RoomChatHistoryPulldown.const_86;
         if(this.var_27 != null)
         {
            this.var_27.containerResized(this.var_41.rectangle);
         }
      }
      
      public function resetArea() : void
      {
         if(this.var_27 == null)
         {
            return;
         }
         this.animationStop();
         this.var_229 = const_1075 + const_467;
         this.var_41.height = this.var_229 + this.var_27.pulldownBarHeight;
         this.var_392.width = this.var_41.width - this.var_27.scrollbarWidth;
         this.var_392.height = this.var_229;
         this.var_121.width = this.var_41.width - this.var_27.scrollbarWidth;
         if(this.historyViewerActive())
         {
            this.var_121.height = this.getTotalContentHeight() + const_467;
         }
         else
         {
            this.var_121.height = this.var_229;
         }
         this.var_392.scrollV = 1;
         if(!this.historyViewerActive())
         {
            this.var_27.containerResized(this.var_41.rectangle);
         }
         this.purgeItems();
         this.alignItems();
      }
      
      private function historyViewerActive() : Boolean
      {
         return this.var_27 == null ? false : Boolean(this.var_27.active);
      }
      
      private function historyViewerVisible() : Boolean
      {
         return this.var_27 == null ? false : Boolean(this.var_27.visible);
      }
      
      public function hideHistoryViewer() : void
      {
         if(this.var_27 != null)
         {
            this.var_27.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return this.var_392.height <= 1;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_69.length)
         {
            _loc4_ = this.var_69[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_681;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = this.var_41.rectangle.bottom;
         this.stretchAreaBottomTo(this.var_41.rectangle.top + _loc1_);
         _loc3_ -= this.var_41.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1231)
         {
            this.resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_69.length)
         {
            _loc4_ = this.var_69[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         this.var_2023 = true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = this.var_41.rectangle.bottom - 0;
         if(_loc1_ < const_1075)
         {
            if(_loc1_ <= this.var_229 + this.var_41.y)
            {
               if(this.historyViewerActive())
               {
                  this.hideHistoryViewer();
               }
               this.resetArea();
               return;
            }
         }
         if(this.var_2023 && !this.historyViewerActive())
         {
            this.resetArea();
            this.var_2023 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(this.historyViewerActive())
         {
            this.var_121.height = this.getTotalContentHeight() + const_467;
            this.alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_69.length)
         {
            _loc1_ = this.var_69[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_69.length)
         {
            _loc1_ = this.var_69[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
   }
}
