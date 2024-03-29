package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class ClubPromoAlertView extends AlertView
   {
       
      
      private var _text:String;
      
      private var var_2756:String;
      
      public function ClubPromoAlertView(param1:HabboNavigator, param2:String, param3:String, param4:String)
      {
         super(param1,"nav_promo_alert",param2);
         this._text = param3;
         this.var_2756 = param4;
      }
      
      override function setupAlertWindow(param1:IFrameWindow) : void
      {
         var _loc2_:IWindowContainer = param1.content;
         _loc2_.findChildByName("body_text").caption = this._text;
         _loc2_.findChildByName("promo_text").caption = this.var_2756;
         var _loc3_:IWindow = _loc2_.findChildByName("ok");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onOk);
         }
         var _loc4_:IWindow = _loc2_.findChildByName("promo_container");
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPromo);
         }
      }
      
      private function onOk(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      private function onPromo(param1:WindowMouseEvent) : void
      {
         navigator.openCatalogClubPage();
         dispose();
      }
   }
}
