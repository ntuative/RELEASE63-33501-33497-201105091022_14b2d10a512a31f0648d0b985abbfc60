package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.StartCampaignMessageComposer;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class QuestTracker implements IDisposable
   {
      
      private static const const_1092:Array = [-2,-3,-2,0,2,3,2,0,2,1,0,1];
      
      private static const const_1093:Array = [1,1,2,2,3,3,4,4,5,5,6,6,4];
      
      private static const const_1095:int = 6;
      
      private static const const_1563:int = 4;
      
      private static const const_689:int = 2;
      
      private static const const_1091:int = 200;
      
      private static const const_304:Array = ["a","b","c","d"];
      
      private static const const_1094:int = 10000;
      
      private static const const_1564:int = 0;
      
      private static const const_688:int = -1;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_233:QuestMessageData;
      
      private var _window:IWindowContainer;
      
      private var var_561:Timer;
      
      private var var_330:int = 0;
      
      private var var_1074:int = 0;
      
      private var var_1611:int = 0;
      
      private var var_1323:int = -1;
      
      private var var_860:int = -1;
      
      private var var_1075:int = -1;
      
      private var var_1324:int;
      
      private var var_1612:int;
      
      private var var_2894:Boolean;
      
      private const const_471:int = 0;
      
      private const const_1937:int = 1;
      
      private const const_1940:int = 2;
      
      private const const_1941:int = 3;
      
      private const const_1939:int = 4;
      
      private const const_1938:int = 5;
      
      private const const_1942:int = 6;
      
      public function QuestTracker(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_233 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_561)
         {
            this.var_561.stop();
            this.var_561 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         if(this._window)
         {
            this.clearPrompt();
            this.var_233 = param1;
            this.var_1074 = 0;
            this.refreshTrackerDetails();
            this.var_1323 = 0;
            this.var_330 = this.const_1941;
         }
      }
      
      public function onQuestCancelled() : void
      {
         this.var_233 = null;
         if(this._window)
         {
            this.clearPrompt();
            this.var_330 = this.const_1940;
         }
      }
      
      public function onRoomEnter() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = Boolean(parseInt(this._questEngine.configuration.getKey("new.identity","0")));
         var _loc2_:String = this.getDefaultCampaign();
         if(this.var_561 == null && _loc1_ && _loc2_ != "" && this._questEngine.isQuestingEnabled())
         {
            _loc3_ = int(this._questEngine.configuration.getKey("questing.startQuestDelayInSeconds","30"));
            this.var_561 = new Timer(_loc3_ * 1000,1);
            this.var_561.addEventListener(TimerEvent.TIMER,this.onStartQuestTimer);
            this.var_561.start();
            Logger.log("Initialized start quest timer with period: " + _loc3_);
         }
      }
      
      public function onRoomExit() : void
      {
         if(this._window != null && this._window.visible)
         {
            this._window.findChildByName("more_info_txt").visible = false;
            this._window.findChildByName("more_info_region").visible = false;
         }
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         var _loc2_:Boolean = this._window && this._window.visible;
         this.var_233 = param1;
         this.prepareTrackerWindow();
         this.refreshTrackerDetails();
         this.refreshPromptFrames();
         this.hideSuccessFrames();
         if(_loc2_)
         {
            this.startNudge();
            this.setupPrompt(this.var_860,const_1563,false);
         }
         else
         {
            this._window.x = this._window.desktop.width;
            this.var_330 = this.const_1937;
            this.setupPrompt(const_1564,const_689,false);
         }
         this._window.visible = true;
         this._questEngine.notifications.setQuestTrackerVisible(true);
      }
      
      private function refreshPromptFrames() : void
      {
         if(!this._questEngine.isQuestWithPrompts(this.var_233))
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < const_304.length)
         {
            this._questEngine.setupPromptFrameImage(this._window,this.var_233,const_304[_loc1_]);
            _loc1_++;
         }
      }
      
      private function prepareTrackerWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._questEngine.getXmlWindow("QuestTracker"));
         this._window.y = 75;
         this._window.findChildByName("more_info_region").procedure = this.onMoreInfo;
         new PendingImage(this._questEngine,this._window.findChildByName("quest_tracker_bg"),"questtrackerbkg");
         var _loc1_:int = 1;
         while(_loc1_ <= const_1095)
         {
            new PendingImage(this._questEngine,this.getSuccessFrame(_loc1_),"checkanim" + _loc1_);
            _loc1_++;
         }
         this.hideSuccessFrames();
      }
      
      private function hideSuccessFrames() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ <= const_1095)
         {
            this.getSuccessFrame(_loc1_).visible = false;
            _loc1_++;
         }
      }
      
      private function hidePromptFrames() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_304.length)
         {
            this.getPromptFrame(const_304[_loc1_]).visible = false;
            _loc1_++;
         }
      }
      
      private function getSuccessFrame(param1:int) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("success_pic_" + param1));
      }
      
      private function getPromptFrame(param1:String) : IBitmapWrapperWindow
      {
         return IBitmapWrapperWindow(this._window.findChildByName("prompt_pic_" + param1));
      }
      
      private function refreshTrackerDetails() : void
      {
         this._questEngine.localization.registerParameter("quests.tracker.caption","quest_name",this._questEngine.getQuestName(this.var_233));
         this._window.findChildByName("desc_txt").caption = this._questEngine.getQuestDesc(this.var_233);
         this._window.findChildByName("more_info_txt").visible = true;
         this._window.findChildByName("more_info_region").visible = true;
         var _loc1_:int = Math.round(100 * this.var_233.completedSteps / this.var_233.totalSteps);
         this._questEngine.localization.registerParameter("quests.tracker.progress","progress","" + _loc1_);
         this._questEngine.setupQuestImage(this._window,this.var_233);
      }
      
      private function onMoreInfo(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.questController.questDetails.showDetails(this.var_233);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._window == null)
         {
            return;
         }
         switch(this.var_330)
         {
            case this.const_1937:
               _loc2_ = this.getDefaultLocationX();
               _loc3_ = this._window.x - _loc2_;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(_loc3_ * param1 * 0.01));
                  this._window.x -= _loc4_;
               }
               else
               {
                  this.var_330 = this.const_471;
                  this._window.x = _loc2_;
               }
               break;
            case this.const_1940:
               _loc2_ = this._window.desktop.width;
               _loc3_ = _loc2_ - this._window.x;
               if(_loc3_ > 0)
               {
                  _loc4_ = Math.max(1,Math.round(param1 * 100 / _loc3_));
                  this._window.x += _loc4_;
               }
               else
               {
                  this.var_330 = this.const_471;
                  this._window.x = _loc2_;
                  this._window.visible = false;
                  this._questEngine.notifications.setQuestTrackerVisible(false);
               }
               break;
            case this.const_1941:
               this.hideSuccessFrames();
               this.getSuccessFrame(const_1093[this.var_1323]).visible = true;
               ++this.var_1323;
               if(this.var_1323 >= const_1093.length)
               {
                  this.var_330 = this.const_1938;
                  this.var_1611 = 1000;
               }
               break;
            case this.const_1942:
               this.setQuestImageVisible(false);
               this.hidePromptFrames();
               this.var_1324 -= param1;
               this.getPromptFrame(const_304[this.var_1075]).visible = true;
               if(this.var_1324 < 0)
               {
                  this.var_1324 = const_1091;
                  ++this.var_1075;
                  if(this.var_1075 >= const_304.length)
                  {
                     this.var_1075 = 0;
                     --this.var_1612;
                     if(this.var_1612 < 1)
                     {
                        this.setupPrompt(const_1094,const_689,true);
                        this.var_330 = this.const_471;
                     }
                  }
               }
               break;
            case this.const_1939:
               if(this.var_1074 >= -1)
               {
                  this._window.x = this.getDefaultLocationX();
                  this.var_330 = this.const_471;
                  this.setupPrompt(const_1094,const_689,false);
               }
               else
               {
                  this._window.x = this.getDefaultLocationX() + const_1092[this.var_1074];
                  ++this.var_1074;
               }
               break;
            case this.const_1938:
               this.var_1611 -= param1;
               if(this.var_1611 < 0)
               {
                  this.var_330 = this.const_471;
                  this._window.visible = false;
               }
               break;
            case this.const_471:
               if(this.var_860 != const_688)
               {
                  this.var_860 -= param1;
                  if(this.var_860 < 0)
                  {
                     this.var_860 = const_688;
                     if(this.var_233 != null && this._questEngine.isQuestWithPrompts(this.var_233))
                     {
                        if(this.var_2894)
                        {
                           this.startNudge();
                        }
                        else
                        {
                           this.var_330 = this.const_1942;
                           this.var_1075 = 0;
                           this.var_1324 = const_1091;
                        }
                     }
                  }
               }
         }
      }
      
      private function getDefaultLocationX() : int
      {
         return this._window.desktop.width - this._window.width - 4;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      private function onStartQuestTimer(param1:TimerEvent) : void
      {
         if(this.hasBlockingWindow())
         {
            Logger.log("Quest start blocked. Waiting some more");
            this.var_561.reset();
            this.var_561.start();
         }
         else
         {
            this._questEngine.questController.questDetails.openForNextQuest = this._questEngine.configuration.getKey("questing.showDetailsForNextQuest") == "HabboCatalogCom_ctlg_infopage2";
            this._questEngine.send(new StartCampaignMessageComposer(this.getDefaultCampaign()));
         }
      }
      
      private function getDefaultCampaign() : String
      {
         var _loc1_:String = this._questEngine.configuration.getKey("questing.defaultCampaign");
         return _loc1_ == null ? "" : _loc1_;
      }
      
      private function hasBlockingWindow() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ <= 2)
         {
            _loc2_ = this._questEngine.windowManager.getDesktop(_loc1_);
            if(_loc2_ != null && this.hasBlockingWindowInLayer(_loc2_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      private function hasBlockingWindowInLayer(param1:IWindowContainer) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         while(_loc2_ < param1.numChildren)
         {
            _loc3_ = param1.getChildAt(_loc2_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if(_loc3_ as IFrameWindow != null)
               {
                  if(_loc3_.name != "mod_start_panel")
                  {
                     return true;
                  }
               }
               else if(_loc3_.name == "welcome_screen")
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      private function setQuestImageVisible(param1:Boolean) : void
      {
         this._window.findChildByName("quest_pic_bitmap").visible = param1;
      }
      
      private function clearPrompt() : void
      {
         this.setupPrompt(const_688,0,false);
      }
      
      private function setupPrompt(param1:int, param2:int, param3:Boolean) : void
      {
         this.setQuestImageVisible(true);
         this.hidePromptFrames();
         this.var_860 = param1;
         this.var_1612 = param2;
         this.var_2894 = param3;
      }
      
      private function startNudge() : void
      {
         this.var_1074 = 0;
         this.var_330 = this.const_1939;
      }
   }
}
