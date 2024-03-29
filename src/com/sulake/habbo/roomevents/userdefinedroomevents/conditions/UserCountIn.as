package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   
   public class UserCountIn implements ConditionType
   {
       
      
      private var var_79:HabboUserDefinedRoomEvents;
      
      private var var_1233:SliderWindowController;
      
      private var var_1234:SliderWindowController;
      
      public function UserCountIn()
      {
         super();
      }
      
      public function get code() : int
      {
         return ConditionCodes.var_2136;
      }
      
      public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push(this.var_1233.getValue());
         _loc2_.push(this.var_1234.getValue());
         return _loc2_;
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
         this.var_79 = param2;
         this.var_1233 = new SliderWindowController(param2,this.getMinInput(param1),param2.assets,1,50,1);
         this.var_1233.addEventListener(Event.CHANGE,this.onMinSliderChange);
         this.var_1233.setValue(1);
         this.var_1234 = new SliderWindowController(param2,this.getMaxInput(param1),param2.assets,1,50,1);
         this.var_1234.addEventListener(Event.CHANGE,this.onMaxSliderChange);
         this.var_1234.setValue(50);
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
         var _loc3_:int = param2.intParams[0];
         var _loc4_:int = param2.intParams[1];
         this.var_1233.setValue(_loc3_);
         this.var_1234.setValue(_loc4_);
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getMinInput(param1:IWindowContainer) : IWindowContainer
      {
         return param1.findChildByName("min_slider_container") as IWindowContainer;
      }
      
      private function getMaxInput(param1:IWindowContainer) : IWindowContainer
      {
         return param1.findChildByName("max_slider_container") as IWindowContainer;
      }
      
      private function onMinSliderChange(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == Event.CHANGE)
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_);
               this.var_79.localization.registerParameter("wiredfurni.params.usercountmin","value","" + _loc4_);
            }
         }
      }
      
      private function onMaxSliderChange(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == Event.CHANGE)
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_);
               this.var_79.localization.registerParameter("wiredfurni.params.usercountmax","value","" + _loc4_);
            }
         }
      }
   }
}
