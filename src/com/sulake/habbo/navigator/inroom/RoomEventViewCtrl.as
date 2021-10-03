package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CancelEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.EditEventMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.TextFieldManager;
   import com.sulake.habbo.navigator.Util;
   
   public class RoomEventViewCtrl
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var _eventNameInput:TextFieldManager;
      
      private var var_869:TextFieldManager;
      
      private var var_923:TextFieldManager;
      
      private var var_921:TextFieldManager;
      
      private var _active:Boolean;
      
      private var var_2102:IWindowContainer;
      
      private var var_2928:ITextWindow;
      
      private var var_2103:ITextWindow;
      
      private var var_2101:ITextWindow;
      
      private var var_1627:IButtonWindow;
      
      private var var_1625:IButtonWindow;
      
      private var var_2927:IButtonWindow;
      
      private var var_1626:IButtonWindow;
      
      private var var_1081:IDropMenuWindow;
      
      public function RoomEventViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      public function refresh(param1:IWindowContainer) : void
      {
         if(!this._active)
         {
            return;
         }
         this.prepareWindow(param1);
         this.clearErrors();
         var _loc2_:RoomEventData = this._navigator.data.roomEventData;
         if(_loc2_ == null)
         {
            this.createEvent();
         }
         else
         {
            this.editEvent(_loc2_);
         }
         this._window.visible = true;
      }
      
      private function editEvent(param1:RoomEventData) : void
      {
         this.var_1081.visible = false;
         this.var_2102.visible = true;
         this.var_2928.text = this._navigator.getText("roomevent_type_" + param1.eventType);
         this._eventNameInput.setText(param1.eventName);
         this.var_869.setText(param1.eventDescription);
         this.var_923.setText(this.getTagFromEvent(param1,1));
         this.var_921.setText(this.getTagFromEvent(param1,2));
         this.var_1627.visible = false;
         this.var_1625.visible = true;
         this.var_1626.visible = true;
         this.var_2103.visible = false;
         this.var_2101.visible = true;
      }
      
      private function createEvent() : void
      {
         this.var_1081.visible = true;
         this.var_2102.visible = false;
         this.var_1627.visible = true;
         this.var_1625.visible = false;
         this.var_1626.visible = false;
         this.var_869.goBackToInitialState();
         this._eventNameInput.goBackToInitialState();
         this.var_923.goBackToInitialState();
         this.var_921.goBackToInitialState();
         this.var_1081.selection = 0;
         this.var_2103.visible = true;
         this.var_2101.visible = false;
      }
      
      private function getInput(param1:String) : ITextFieldWindow
      {
         return ITextFieldWindow(this._window.findChildByName(param1));
      }
      
      private function getEventType() : int
      {
         var _loc1_:int = this.var_1081.selection;
         return _loc1_ + 1;
      }
      
      private function onCreateButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = this.getEventType();
         var _loc4_:String = this._eventNameInput.getText();
         var _loc5_:String = this.var_869.getText();
         var _loc6_:Array = new Array();
         this.addTag(_loc6_,this.var_923.getText());
         this.addTag(_loc6_,this.var_921.getText());
         if(!this.isMandatoryFieldsFilled())
         {
            return;
         }
         this._navigator.send(new CreateEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         this.endEdit();
      }
      
      private function onEditButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = this._navigator.data.roomEventData.eventType;
         var _loc4_:String = this._eventNameInput.getText();
         var _loc5_:String = this.var_869.getText();
         var _loc6_:Array = new Array();
         this.addTag(_loc6_,this.var_923.getText());
         this.addTag(_loc6_,this.var_921.getText());
         if(!this.isMandatoryFieldsFilled())
         {
            return;
         }
         this._navigator.send(new EditEventMessageComposer(_loc3_,_loc4_,_loc5_,_loc6_));
         this.endEdit();
      }
      
      private function onEndButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new CancelEventMessageComposer());
         this.endEdit();
      }
      
      private function onCancelButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.endEdit();
      }
      
      private function isMandatoryFieldsFilled() : Boolean
      {
         this.clearErrors();
         if(!this._eventNameInput.checkMandatory(this._navigator.getText("navigator.eventsettings.nameerr")))
         {
            return false;
         }
         if(!this.var_869.checkMandatory(this._navigator.getText("navigator.eventsettings.descerr")))
         {
            return false;
         }
         return true;
      }
      
      private function clearErrors() : void
      {
         this._eventNameInput.clearErrors();
         this.var_869.clearErrors();
         this.var_923.clearErrors();
         this.var_921.clearErrors();
      }
      
      private function prepareWindow(param1:IWindowContainer) : void
      {
         if(this._window == null)
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_event_settings"));
            this.var_2102 = IWindowContainer(this.find("event_type_disabled_cont"));
            this.var_2928 = ITextWindow(this.find("event_type_disabled_text"));
            this.var_2103 = ITextWindow(this.find("create_caption"));
            this.var_2101 = ITextWindow(this.find("edit_caption"));
            this.var_1627 = IButtonWindow(this.find("create_button"));
            this.var_1625 = IButtonWindow(this.find("edit_button"));
            this.var_2927 = IButtonWindow(this.find("cancel_button"));
            this.var_1626 = IButtonWindow(this.find("end_button"));
            this.var_1081 = IDropMenuWindow(this.find("event_type"));
            this.prepareEventTypes();
            Util.setProcDirectly(this.var_1627,this.onCreateButtonClick);
            Util.setProcDirectly(this.var_1625,this.onEditButtonClick);
            Util.setProcDirectly(this.var_1626,this.onEndButtonClick);
            Util.setProcDirectly(this.var_2927,this.onCancelButtonClick);
            this._eventNameInput = new TextFieldManager(this._navigator,this.getInput("event_name"),25);
            this.var_869 = new TextFieldManager(this._navigator,this.getInput("event_desc"),100);
            this.var_923 = new TextFieldManager(this._navigator,this.getInput("event_tag_1"),25);
            this.var_921 = new TextFieldManager(this._navigator,this.getInput("event_tag_2"),25);
            param1.addChild(this._window);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function prepareEventTypes() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 1;
         while(_loc3_ < 100)
         {
            _loc4_ = "roomevent_type_" + _loc3_;
            _loc5_ = this._navigator.getText(_loc4_);
            if(_loc5_ == null || _loc5_ == _loc4_)
            {
               break;
            }
            _loc1_.push(_loc5_);
            _loc3_++;
         }
         this.var_1081.populate(_loc1_);
      }
      
      private function endEdit() : void
      {
         this._active = false;
         this._navigator.roomInfoViewCtrl.reload();
      }
      
      private function getTagFromEvent(param1:RoomEventData, param2:int) : String
      {
         var _loc3_:String = param1.tags[param2 - 1];
         return _loc3_ == null ? "" : _loc3_;
      }
      
      private function addTag(param1:Array, param2:String) : void
      {
         if(param2 != "")
         {
            param1.push(param2);
         }
      }
   }
}
