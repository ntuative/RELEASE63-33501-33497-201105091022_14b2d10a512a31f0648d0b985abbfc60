package com.sulake.habbo.ui
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Rectangle;
   
   public class DesktopLayoutManager
   {
       
      
      private const const_1505:String = "room_view";
      
      private const const_2195:String = "room_widget";
      
      private var var_48:IWindowContainer;
      
      private var var_828:int = 50;
      
      private var var_3002:XML = null;
      
      public function DesktopLayoutManager()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(this.var_48 != null)
         {
            this.var_48.dispose();
         }
      }
      
      public function setLayout(param1:XML, param2:IHabboWindowManager, param3:IHabboConfigurationManager) : void
      {
         var _loc5_:* = null;
         var _loc7_:int = 0;
         if(param1 == null || param2 == null)
         {
            throw new Error("Unable to set room desktop layout.");
         }
         this.var_3002 = param1.copy();
         this.var_48 = param2.buildFromXML(param1,0) as IWindowContainer;
         if(this.var_48 == null)
         {
            throw new Error("Failed to build layout from XML.");
         }
         this.var_48.width = this.var_48.desktop.width;
         this.var_48.height = this.var_48.desktop.height;
         var _loc4_:IWindowContainer = this.var_48.desktop as IWindowContainer;
         _loc4_.addChildAt(this.var_48,0);
         if(param3)
         {
            if(param3.getKey("friendbar.enabled") == "HabboCatalogCom_ctlg_infopage2")
            {
               this.var_48.findChildByTag("room_widget_infostand").y = this.var_48.findChildByTag("room_widget_infostand").y - 47;
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < this.var_48.numChildren)
         {
            _loc5_ = this.var_48.getChildAt(_loc6_);
            _loc7_ = false || false;
            if(_loc5_.testParamFlag(_loc7_))
            {
               _loc5_.addEventListener(WindowEvent.const_155,this.trimContainer);
            }
            _loc6_++;
         }
      }
      
      private function trimContainer(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.window as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.numChildren != 1)
         {
            return;
         }
         var _loc3_:IWindow = _loc2_.getChildAt(0);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.width = _loc3_.width;
         _loc2_.height = _loc3_.height;
      }
      
      public function addWidgetWindow(param1:String, param2:IWindow) : Boolean
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         if(param2 == null)
         {
            return false;
         }
         if(param1 == RoomWidgetEnum.CHAT_INPUT_WIDGET)
         {
            _loc7_ = this.var_48.getChildByName("background_widgets") as IWindowContainer;
            _loc7_.addChild(param2);
            return true;
         }
         var _loc3_:Array = param2.tags;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(String(_loc3_[_loc5_]).indexOf(this.const_2195) == 0)
            {
               _loc4_ = _loc3_[_loc5_] as String;
               break;
            }
            _loc5_++;
         }
         if(_loc4_ == null)
         {
            return false;
         }
         var _loc6_:IWindowContainer = this.var_48.getChildByTag(_loc4_) as IWindowContainer;
         if(_loc6_ == null)
         {
            return false;
         }
         param2.x = 0;
         param2.y = 0;
         _loc6_.addChild(param2);
         _loc6_.width = param2.width;
         _loc6_.height = param2.height;
         return true;
      }
      
      public function addRoomView(param1:IWindow) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:IWindowContainer = this.var_48.getChildByTag(this.const_1505) as IWindowContainer;
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_.addChild(param1);
         return true;
      }
      
      public function set toolbarOrientation(param1:String) : void
      {
         var _loc2_:Rectangle = new Rectangle();
         switch(param1)
         {
            case "LEFT":
               _loc2_.x = this.var_828;
               _loc2_.width = this.var_48.desktop.width - this.var_828;
               _loc2_.y = 0;
               _loc2_.height = this.var_48.desktop.height;
               break;
            case "RIGHT":
               _loc2_.x = 0;
               _loc2_.width = this.var_48.desktop.width - this.var_828;
               _loc2_.y = 0;
               _loc2_.height = this.var_48.desktop.height;
               break;
            case "TOP":
               _loc2_.x = 0;
               _loc2_.width = this.var_48.desktop.width;
               _loc2_.y = this.var_828;
               _loc2_.height = this.var_48.desktop.height - this.var_828;
               break;
            case "BOTTOM":
               _loc2_.x = 0;
               _loc2_.width = this.var_48.desktop.width;
               _loc2_.y = 0;
               _loc2_.height = this.var_48.desktop.height - this.var_828;
         }
         if(!_loc2_.isEmpty())
         {
            this.var_48.rectangle = _loc2_;
         }
      }
      
      public function set toolbarSize(param1:int) : void
      {
         this.var_828 = param1;
      }
      
      public function get roomViewRect() : Rectangle
      {
         if(this.var_48 == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = this.var_48.findChildByTag(this.const_1505) as IWindowContainer;
         if(!_loc1_)
         {
            return null;
         }
         var _loc2_:Rectangle = _loc1_.rectangle.clone();
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.offset(this.var_48.x,this.var_48.y);
         return _loc2_;
      }
      
      public function getRoomView() : IWindow
      {
         if(this.var_48 == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = this.var_48.findChildByTag(this.const_1505) as IWindowContainer;
         if(_loc1_ != null && _loc1_.numChildren > 0)
         {
            return _loc1_.getChildAt(0);
         }
         return null;
      }
   }
}
