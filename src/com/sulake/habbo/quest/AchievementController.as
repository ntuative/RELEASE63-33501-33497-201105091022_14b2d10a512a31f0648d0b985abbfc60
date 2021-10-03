package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   import com.sulake.habbo.communication.messages.outgoing.inventory.achievements.GetAchievementsComposer;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AchievementController implements IDisposable
   {
      
      private static const const_1039:int = 4;
      
      private static const const_1037:int = 5;
      
      private static const const_1038:int = 8;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:IFrameWindow;
      
      private var var_635:IWindowContainer;
      
      private var var_788:IWindowContainer;
      
      private var var_634:IWindowContainer;
      
      private var var_1425:IWindowContainer;
      
      private var var_1485:IWindowContainer;
      
      private var var_100:AchievementCategories;
      
      private var _category:AchievementCategory;
      
      private var var_257:AchievementData;
      
      private var var_441:Timer;
      
      private var var_1199:Dictionary;
      
      public function AchievementController(param1:HabboQuestEngine)
      {
         this.var_1199 = new Dictionary();
         super();
         this._questEngine = param1;
         this.var_441 = new Timer(1000,1);
         this.var_441.addEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
      }
      
      public static function moveAllChildrenToColumn(param1:IWindowContainer, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc5_ != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      public static function getLowestPoint(param1:IWindowContainer) : int
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_.visible)
            {
               _loc2_ = Math.max(_loc2_,_loc4_.y + _loc4_.height);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_1199 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_441)
         {
            this.var_441.removeEventListener(TimerEvent.TIMER,this.doBadgeRefresh);
            this.var_441.reset();
            this.var_441 = null;
         }
         this.var_635 = null;
         this.var_634 = null;
         this.var_634 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      public function onToolbarClick() : void
      {
         if(this.isVisible())
         {
            this.close();
         }
         else if(this.var_100 == null)
         {
            this._questEngine.send(new GetAchievementsComposer());
         }
         else
         {
            this.refresh();
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function onAchievements(param1:Array) : void
      {
         if(this.var_100 == null)
         {
            this.var_100 = new AchievementCategories(param1);
         }
         this.refresh();
         this._window.visible = true;
         this._window.activate();
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshCategoryList();
         this.refreshAchievementsHeader();
         this.refreshAchievementList();
         this.refreshAchievementDetails();
         moveAllChildrenToColumn(this._window.content,8,5);
         this._window.height = getLowestPoint(this._window.content) + 50;
      }
      
      private function refreshCategoryList() : void
      {
         var _loc3_:Boolean = false;
         if(this._category != null)
         {
            this.var_635.visible = false;
            return;
         }
         this.var_635.visible = true;
         var _loc1_:Array = this.var_100.categoryList;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshCategoryEntry(true,_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshCategoryEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_635.height = getLowestPoint(this.var_635);
      }
      
      private function refreshAchievementList() : void
      {
         var _loc3_:Boolean = false;
         if(this._category == null)
         {
            this.var_788.visible = false;
            return;
         }
         this.var_788.visible = true;
         Logger.log(this._category.code + " has " + this._category.achievements.length + " achievemenets");
         var _loc1_:Array = this._category.achievements;
         var _loc2_:int = 0;
         while(true)
         {
            if(_loc2_ < _loc1_.length)
            {
               this.refreshAchievementEntry(true,_loc2_,_loc1_[_loc2_]);
            }
            else
            {
               _loc3_ = this.refreshAchievementEntry(false,_loc2_,null);
               if(_loc3_)
               {
                  break;
               }
            }
            _loc2_++;
         }
         this.var_788.height = getLowestPoint(this.var_788);
      }
      
      private function refreshAchievementsHeader() : void
      {
         if(this._category == null)
         {
            this.var_1485.visible = false;
            return;
         }
         this.var_1485.visible = true;
         this.var_1485.findChildByName("category_name_txt").caption = this._questEngine.getAchievementCategoryName(this._category);
      }
      
      private function refreshAchievementDetails() : void
      {
         if(this.var_257 == null)
         {
            this.var_634.visible = false;
            return;
         }
         this.var_634.visible = true;
         this.var_634.findChildByName("achievement_name_txt").caption = this._questEngine.localization.getAchievementName(this.var_257.badgeId);
         this.var_634.findChildByName("achievement_desc_txt").caption = this._questEngine.localization.getAchievementDesc(this.var_257.badgeId,this.var_257.scoreLimit);
         var _loc1_:String = this._questEngine.localization.getKey("inventory.achievements.unit." + this.var_257.type,"");
         var _loc2_:String = "inventory.achievements.entrydetails." + this.var_257.levelRewardPointType;
         var _loc3_:ITextWindow = this.var_634.findChildByName("progress_txt") as ITextWindow;
         this._questEngine.localization.registerParameter(_loc2_,"currentpoints","" + this.var_257.currentPoints);
         this._questEngine.localization.registerParameter(_loc2_,"scorelimit","" + this.var_257.scoreLimit);
         this._questEngine.localization.registerParameter(_loc2_,"levelrewardpoints","" + this.var_257.levelRewardPoints);
         this._questEngine.localization.registerParameter(_loc2_,"unit","" + _loc1_);
         _loc3_.text = this._questEngine.localization.getKey(_loc2_);
         _loc3_.visible = true;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IFrameWindow(this._questEngine.getXmlWindow("Achievements"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.findChildByName("back_button").procedure = this.onBack;
         this._window.center();
         this.var_635 = IWindowContainer(this._window.findChildByName("categories_cont"));
         this.var_1485 = IWindowContainer(this._window.findChildByName("achievements_header_cont"));
         this.var_788 = IWindowContainer(this._window.findChildByName("achievements_cont"));
         this.var_634 = IWindowContainer(this._window.findChildByName("achievement_cont"));
         this.var_1425 = IWindowContainer(this._window.findChildByName("footer_cont"));
      }
      
      private function refreshCategoryEntry(param1:Boolean, param2:int, param3:AchievementCategory) : Boolean
      {
         var _loc4_:IWindowContainer = IWindowContainer(this.var_635.getChildByName("" + param2));
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = IWindowContainer(this._questEngine.getXmlWindow("AchievementCategory"));
            _loc4_.name = "" + param2;
            this.var_635.addChild(_loc4_);
            new PendingImage(this._questEngine,IBitmapWrapperWindow(_loc4_.findChildByName("completion_bg_green_bitmap")),"quest_counterbkg2");
            _loc4_.findChildByName("bg").procedure = this.onSelectCategory;
            _loc4_.x = (_loc4_.width + const_1037) * (param2 % const_1039);
            _loc4_.y = (_loc4_.height + const_1037) * Math.floor(param2 / const_1039);
         }
         _loc4_.findChildByName("bg").id = param2;
         if(param1)
         {
            _loc4_.findChildByName("header_txt").caption = this._questEngine.getAchievementCategoryName(param3);
            _loc4_.findChildByName("completion_txt").caption = param3.getProgress() + "/" + param3.getMaxProgress();
            this._questEngine.setupAchievementCategoryImage(_loc4_,param3);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.visible = false;
         }
         return false;
      }
      
      private function refreshAchievementEntry(param1:Boolean, param2:int, param3:AchievementData) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:IWindowContainer = IWindowContainer(this.var_788.getChildByName("" + param2));
         if(_loc4_ == null)
         {
            if(!param1)
            {
               return true;
            }
            _loc4_ = IWindowContainer(this._questEngine.getXmlWindow("Achievement"));
            _loc4_.name = "" + param2;
            this.var_788.addChild(_loc4_);
            _loc4_.findChildByName("bg").procedure = this.onSelectAchievement;
            _loc5_ = _loc4_.findChildByName("achievement_pic_bitmap") as IBitmapWrapperWindow;
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
            _loc4_.x = _loc4_.width * (param2 % const_1038);
            _loc4_.y = _loc4_.height * Math.floor(param2 / const_1038);
         }
         _loc4_.findChildByName("bg").id = param2;
         if(param1)
         {
            this.refreshBadgeImage(_loc4_,param3);
            _loc4_.findChildByName("bg").color = param3 == this.var_257 ? 13369344 : uint(255);
            _loc4_.visible = true;
         }
         else
         {
            _loc4_.visible = false;
         }
         Logger.log("TSUP: " + param2 + ", " + _loc4_.visible + ", " + _loc4_.rectangle + ", " + (param3 == null ? "" : param3.badgeId));
         return false;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onSelectCategory(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Category index: " + _loc3_);
         this._category = this.var_100.categoryList[_loc3_];
         Logger.log("Category: " + this._category.code);
         this.refresh();
      }
      
      private function onSelectAchievement(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = param2.id;
         Logger.log("Achievement index: " + _loc3_);
         this.var_257 = this._category.achievements[_loc3_];
         Logger.log("Achievement: " + this.var_257.badgeId);
         this.refresh();
      }
      
      private function onBack(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._category = null;
         this.var_257 = null;
         this.refresh();
      }
      
      private function refreshBadgeImage(param1:IWindowContainer, param2:AchievementData) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.findChildByName("achievement_pic_bitmap") as IBitmapWrapperWindow;
         if(_loc3_.tags[0] == param2.badgeId)
         {
            Logger.log("No need to refresh campaign image...");
            return;
         }
         _loc3_.tags[0] = param2.badgeId;
         var _loc4_:BitmapData = this.var_1199[param2.badgeId];
         if(_loc4_ == null)
         {
            _loc4_ = this._questEngine.sessionDataManager.getBadgeImage(param2.badgeId);
            this.var_1199[param2.badgeId] = _loc4_;
         }
         var _loc5_:Point = new Point((_loc3_.width - _loc4_.width) / 2,(_loc3_.height - _loc4_.height) / 2);
         _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
         _loc3_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,true);
         _loc3_.visible = true;
      }
      
      private function doBadgeRefresh(param1:TimerEvent) : void
      {
         this.var_441.reset();
         this.refresh();
         Logger.log("Now updating list...");
      }
      
      public function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         Logger.log("Got badge: " + param1.badgeId + ", " + this.var_441.running);
         this.var_1199[param1.badgeId] = param1.badgeImage;
         if(!this.var_441.running)
         {
            this.var_441.start();
         }
      }
   }
}
