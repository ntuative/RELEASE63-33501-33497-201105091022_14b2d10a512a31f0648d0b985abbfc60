package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.external.ExternalInterface;
   
   public class MeMenuSettingsMenuView implements IMeMenuView
   {
       
      
      private var _widget:MeMenuWidget;
      
      private var _window:IWindowContainer;
      
      public function MeMenuSettingsMenuView()
      {
         super();
      }
      
      public function init(param1:MeMenuWidget, param2:String) : void
      {
         this._widget = param1;
         this.createWindow(param2);
      }
      
      public function dispose() : void
      {
         this._widget = null;
         this._window.dispose();
         this._window = null;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc2_:XmlAsset = this._widget.assets.getAssetByName("memenu_settings_menu") as XmlAsset;
         this._window = this._widget.windowManager.buildFromXML(_loc2_.content as XML) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.name = param1;
         this._window.procedure = this.eventHandler;
         if(true || this._widget.config.getKey("has.identity") != "1")
         {
            this._window.findChildByName("character_settings").disable();
         }
         else
         {
            this._window.findChildByName("identity_text").visible = false;
         }
         this._widget.mainContainer.addChild(this._window);
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "character_settings":
               ExternalInterface.call("FlashExternalInterface.openHabblet","avatars");
               this._widget.hide();
               break;
            case "sound_settings":
               this._widget.changeView(MeMenuWidget.const_939);
               break;
            case "back":
               this._widget.changeView(MeMenuWidget.const_110);
         }
      }
   }
}
