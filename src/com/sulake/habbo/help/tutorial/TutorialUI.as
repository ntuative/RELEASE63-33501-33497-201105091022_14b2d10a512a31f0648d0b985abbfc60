package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_91:String = "TUI_MAIN_VIEW";
      
      public static const const_317:String = "TUI_NAME_VIEW";
      
      public static const const_428:String = "TUI_CLOTHES_VIEW";
      
      public static const const_511:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_2378:int = 0;
      
      private var var_2377:int = 0;
      
      private var var_32:HabboHelp;
      
      private var _window:IFrameWindow;
      
      private var var_44:ITutorialUIView;
      
      private var var_359:NameChangeView;
      
      private var var_1179:Boolean = false;
      
      private var var_1178:Boolean = false;
      
      private var var_1449:Boolean = false;
      
      private var var_1776:Boolean = false;
      
      private var var_2379:Boolean;
      
      public function TutorialUI(param1:HabboHelp, param2:Boolean = true)
      {
         super();
         this.var_32 = param1;
         this.var_2379 = param2;
         this.var_32.events.addEventListener(HabboHelpTutorialEvent.const_478,this.onTaskDoneEvent);
         this.var_32.events.addEventListener(HabboHelpTutorialEvent.const_543,this.onTaskDoneEvent);
         this.var_32.events.addEventListener(HabboHelpTutorialEvent.const_538,this.onTaskDoneEvent);
         if(this.var_32.sessionDataManager != null)
         {
            this.var_32.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_333,this.onFigureUpdate);
         }
      }
      
      public function get help() : HabboHelp
      {
         return this.var_32;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_32.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_32.localization;
      }
      
      public function get myName() : String
      {
         return this.var_32.ownUserName;
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1179 && this.var_1178 && this.var_1449;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1179;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1178;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1449;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_32)
         {
            this.var_32.events.removeEventListener(HabboHelpTutorialEvent.const_478,this.onTaskDoneEvent);
            this.var_32.events.removeEventListener(HabboHelpTutorialEvent.const_543,this.onTaskDoneEvent);
            this.var_32.events.removeEventListener(HabboHelpTutorialEvent.const_538,this.onTaskDoneEvent);
            if(this.var_32.sessionDataManager != null)
            {
               this.var_32.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_333,this.onFigureUpdate);
            }
            this.var_32 = null;
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1179 = param1;
         this.var_1178 = param2;
         this.var_1449 = param3;
         if(this.var_44 == null || this.var_44.id == const_91)
         {
            this.prepareForTutorial();
            this.showView(const_91);
         }
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_478:
               this.var_1449 = true;
               if(this.var_44 != null && this.var_44.id == const_511)
               {
                  this.showView(const_91);
               }
               break;
            case HabboHelpTutorialEvent.const_543:
               if(this.var_44 != null && this.var_44.id == const_428)
               {
                  this.var_1776 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_538:
               if(this.var_1776)
               {
                  this.var_1776 = false;
                  this.showView(const_91);
               }
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_32)
            {
               this.var_32.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_2378 = this._window.width - _loc2_.width;
            this.var_2377 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_44 != null)
         {
            this.var_44.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_91:
               if(this.var_359 != null)
               {
                  this.var_359.dispose();
               }
               if(this.var_2379)
               {
                  this.var_44 = new TutorialMainView(_loc2_,this);
                  break;
               }
               this._window.visible = false;
               return;
               break;
            case const_317:
               this._window.visible = false;
               if(this.var_359 == null)
               {
                  this.var_359 = new NameChangeView(this);
               }
               this.var_359.showMainView();
               this.prepareForTutorial();
               break;
            case const_428:
               this.var_44 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_511:
               this.var_44 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_2377;
         this._window.width = _loc2_.width + this.var_2378;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_32 == null || this.var_32.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_32.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_32.windowManager == null)
         {
            return null;
         }
         return this.var_32.windowManager.buildFromXML(XML(_loc3_.content),param2);
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function disposeView() : void
      {
         if(this.var_44 != null)
         {
            this.var_44.dispose();
            this.var_44 = null;
         }
         if(this.var_359 != null)
         {
            this.var_359.dispose();
            this.var_359 = null;
         }
         this.disposeWindow();
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function prepareForTutorial() : void
      {
         if(this.var_32 == null || this.var_32.events == null)
         {
            return;
         }
         this.var_32.hideUI();
         this.var_32.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_126));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_32.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_32.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_32 || !this.var_32.localization || !this.var_32.windowManager)
         {
            return;
         }
         this.var_1178 = true;
         this.var_32.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_32.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
         if(this.var_44 != null && (this.var_44.id == const_317 || this.var_44.id == const_91))
         {
            this.showView(const_91);
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         var _loc2_:* = false;
         if(this.var_32 == null || param1 == null)
         {
            return;
         }
         if(!this.var_1179)
         {
            if(this.var_32.sessionDataManager != null)
            {
               _loc2_ = param1.userId == this.var_32.sessionDataManager.userId;
               if(_loc2_)
               {
                  this.var_32.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_333,this.onFigureUpdate);
                  this.onUserChanged();
               }
            }
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1179 = true;
         if(this.var_44 != null && (this.var_44.id == const_428 || this.var_44.id == const_91))
         {
            this.showView(const_91);
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_572)
         {
            this.var_1178 = true;
            this.showView(TutorialUI.const_91);
         }
         else
         {
            this.var_359.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_572)
         {
            this.var_359.checkedName = _loc2_.name;
         }
         else
         {
            this.var_359.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
