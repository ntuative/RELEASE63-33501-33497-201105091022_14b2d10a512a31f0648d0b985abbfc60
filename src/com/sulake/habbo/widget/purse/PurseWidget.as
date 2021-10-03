package com.sulake.habbo.widget.purse
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetPurseData;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class PurseWidget extends RoomWidgetBase
   {
       
      
      private var _view:IWindowContainer;
      
      private var var_2071:int;
      
      private var var_2072:int;
      
      private const const_1936:int = 3;
      
      private const const_2205:uint = 4.291993382E9;
      
      private const const_2206:uint = 4.29080704E9;
      
      private const const_2203:uint = 4.285767869E9;
      
      private const const_2204:uint = 4.28366404E9;
      
      public function PurseWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager)
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super(param1,param2,param3);
         var _loc4_:XmlAsset = param2.getAssetByName("purse_widget") as XmlAsset;
         if(_loc4_)
         {
            this._view = param1.buildFromXML(_loc4_.content as XML,1) as IWindowContainer;
            _loc5_ = this._view.desktop;
            this._view.x = _loc5_.width - this._view.width - this.const_1936;
            this._view.y = this.const_1936;
            this._view.visible = false;
            this._view.findChildByName("credits_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCreditsClick);
            this._view.findChildByName("pixels_container").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPixelsClick);
            _loc6_ = [];
            this._view.groupChildrenWithTag("ORANGE",_loc6_,true);
            for each(_loc7_ in _loc6_)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onOrangeMouseOver);
               _loc7_.addEventListener(WindowMouseEvent.const_25,this.onOrangeMouseOut);
            }
            _loc6_ = [];
            this._view.groupChildrenWithTag("BLUE",_loc6_,true);
            for each(_loc7_ in _loc6_)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onBlueMouseOver);
               _loc7_.addEventListener(WindowMouseEvent.const_25,this.onBlueMouseOut);
            }
         }
      }
      
      override public function initialize(param1:int = 0) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetGetPurseData());
         if(this._view)
         {
            this._view.visible = true;
         }
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_111,this.onPixelBalance);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_75,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_111,this.onPixelBalance);
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2071 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("credits").caption = this.var_2071.toString();
            this._view.findChildByName("credits_shadow").caption = this.var_2071.toString();
         }
      }
      
      private function onPixelBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2072 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("pixels").caption = this.var_2072.toString();
            this._view.findChildByName("pixels_shadow").caption = this.var_2072.toString();
         }
      }
      
      private function onCreditsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1151));
      }
      
      private function onPixelsClick(param1:WindowMouseEvent) : void
      {
         messageListener.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1192));
      }
      
      private function onOrangeMouseOver(param1:WindowMouseEvent) : void
      {
         param1.window.color = this.const_2206;
      }
      
      private function onOrangeMouseOut(param1:WindowMouseEvent) : void
      {
         param1.window.color = this.const_2205;
      }
      
      private function onBlueMouseOver(param1:WindowMouseEvent) : void
      {
         param1.window.color = this.const_2204;
      }
      
      private function onBlueMouseOut(param1:WindowMouseEvent) : void
      {
         param1.window.color = this.const_2203;
      }
   }
}
