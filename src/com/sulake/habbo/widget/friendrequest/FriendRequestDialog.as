package com.sulake.habbo.widget.friendrequest
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FriendRequestDialog
   {
       
      
      private var _window:IWindowContainer;
      
      private var _widget:FriendRequestWidget;
      
      private var var_1251:int;
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_1361:Boolean = false;
      
      private var var_1931:Boolean = false;
      
      private var var_1930:Boolean = false;
      
      public function FriendRequestDialog(param1:FriendRequestWidget, param2:int, param3:int, param4:String)
      {
         super();
         this._widget = param1;
         this.var_1251 = param2;
         this._userId = param3;
         this._userName = param4;
      }
      
      public function dispose() : void
      {
         this._widget = null;
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(HabboWindowParam.const_40,true);
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function createWindow() : void
      {
         if(!this._widget || !this._widget.assets || !this._widget.windowManager)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("instant_friend_request") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         this._window = this._widget.windowManager.buildFromXML(_loc1_.content as XML,0) as IWindowContainer;
         if(!this._window)
         {
            return;
         }
         this._window.addEventListener(WindowEvent.const_598,this.onDeactivated);
         var _loc2_:ITextWindow = this._window.findChildByName("text") as ITextWindow;
         if(_loc2_)
         {
            _loc2_.text = this._widget.localizations.registerParameter("widget.friendrequest.from","username",this._userName);
         }
         var _loc3_:IWindow = this._window.findChildByName("accept_button");
         this.addMouseClickListener(_loc3_,this.onAccept);
         var _loc4_:IWindow = this._window.findChildByName("decline_button");
         this.addMouseClickListener(_loc4_,this.onDecline);
         var _loc5_:IWindow = this._window.findChildByName("close_button");
         this.addMouseClickListener(_loc5_,this.onClose);
         this.setImageAsset(_loc5_ as IBitmapWrapperWindow,"bubble_close");
         this.setImageAsset(this._window.findChildByName("pointer") as IBitmapWrapperWindow,"bubble_arrow");
         this._window.procedure = this.windowEventHandler;
         this._window.visible = false;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               this.var_1361 = true;
               break;
            case WindowMouseEvent.const_25:
               this.var_1361 = false;
               break;
            case WindowMouseEvent.const_42:
               this.var_1931 = true;
               break;
            case WindowMouseEvent.const_52:
            case WindowMouseEvent.const_207:
               this.var_1931 = false;
         }
      }
      
      public function setImageAsset(param1:IBitmapWrapperWindow, param2:String) : void
      {
         if(!param1 || !this._widget || !this._widget.assets)
         {
            return;
         }
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(!_loc4_)
         {
            return;
         }
         if(param1.bitmap)
         {
            param1.bitmap.dispose();
         }
         param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         param1.bitmap.draw(_loc4_);
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function show() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            this._window.activate();
         }
      }
      
      public function set targetRect(param1:Rectangle) : void
      {
         var _loc5_:* = null;
         if(!param1)
         {
            this._widget.ignoreRequest(this.var_1251);
            return;
         }
         if(this.var_1361 || this.var_1931)
         {
            return;
         }
         var _loc2_:Boolean = true;
         if(!this._window)
         {
            this.createWindow();
            _loc2_ = false;
         }
         if(!this._window)
         {
            return;
         }
         var _loc3_:Point = new Point(param1.left + param1.width / 2 - this._window.width / 2,param1.top - this._window.height + 10);
         var _loc4_:Number = Point.distance(this._window.rectangle.topLeft,_loc3_);
         if(_loc2_ && _loc4_ > 5)
         {
            _loc5_ = Point.interpolate(this._window.rectangle.topLeft,_loc3_,0.5);
            this._window.x = _loc5_.x;
            this._window.y = _loc5_.y;
         }
         else
         {
            this._window.x = _loc3_.x;
            this._window.y = _loc3_.y;
         }
         if(!this._window.visible)
         {
            this.show();
         }
         if(this.var_1930)
         {
            this.show();
            this.var_1930 = false;
         }
      }
      
      private function onDeactivated(param1:WindowEvent) : void
      {
         this.var_1930 = true;
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         if(this._widget != null)
         {
            this._widget.ignoreRequest(this.var_1251);
         }
      }
      
      private function onAccept(param1:WindowMouseEvent) : void
      {
         if(this._widget != null)
         {
            this._widget.acceptRequest(this.var_1251);
         }
      }
      
      private function onDecline(param1:WindowMouseEvent) : void
      {
         if(this._widget != null)
         {
            this._widget.declineRequest(this.var_1251);
         }
      }
   }
}
