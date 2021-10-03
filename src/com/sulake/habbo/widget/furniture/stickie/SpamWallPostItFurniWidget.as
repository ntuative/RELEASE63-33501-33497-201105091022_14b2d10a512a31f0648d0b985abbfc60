package com.sulake.habbo.widget.furniture.stickie
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.widget.events.RoomWidgetSpamWallPostItEditEvent;
   import com.sulake.habbo.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class SpamWallPostItFurniWidget extends StickieFurniWidget
   {
       
      
      private var var_435:String = "";
      
      private var _inventory:IHabboInventory = null;
      
      private var _roomEngine:IRoomEngine = null;
      
      public function SpamWallPostItFurniWidget(param1:IHabboWindowManager, param2:IHabboInventory, param3:IRoomEngine, param4:IAssetLibrary = null)
      {
         var_2179 = "spamwall_postit_container";
         this._inventory = param2;
         this._roomEngine = param3;
         super(param1,param4);
      }
      
      override public function dispose() : void
      {
         var_193 = -1;
         this.var_435 = "";
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         param1.addEventListener(RoomWidgetSpamWallPostItEditEvent.const_540,this.onEditPostItRequest);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetSpamWallPostItEditEvent.const_540,this.onEditPostItRequest);
      }
      
      override protected function onObjectUpdate(param1:RoomWidgetStickieDataUpdateEvent) : void
      {
      }
      
      private function onEditPostItRequest(param1:RoomWidgetSpamWallPostItEditEvent) : void
      {
         var _loc3_:* = null;
         hideInterface(false);
         var_193 = param1.objectId;
         this.var_435 = param1.location;
         var _loc2_:* = null;
         if(this._inventory != null)
         {
            _loc2_ = this._inventory.getItemById(FurniModel.const_49,var_193);
         }
         if(_loc2_ != null && this._roomEngine != null)
         {
            _loc3_ = this._roomEngine.getWallItemType(_loc2_.type);
            var_886 = !!_loc3_.match("vd") ? "post_it_vd" : "post_it";
         }
         else
         {
            var_886 = "post_it";
         }
         _text = "";
         var_336 = "FFFF33";
         _controller = true;
         showInterface();
      }
      
      override protected function sendUpdate() : void
      {
         var _loc1_:* = null;
         if(var_193 != -1)
         {
            storeTextFromField();
            Logger.log("Spamwall Post-It Widget Send Update");
            if(messageListener != null)
            {
               _loc1_ = new RoomWidgetSpamWallPostItFinishEditingMessage(RoomWidgetSpamWallPostItFinishEditingMessage.const_747,var_193,this.var_435,_text,var_336);
               messageListener.processWidgetMessage(_loc1_);
            }
            hideInterface(false);
         }
      }
      
      override protected function sendSetColor(param1:uint) : void
      {
         storeTextFromField();
         var _loc2_:String = param1.toString(16).toUpperCase();
         if(_loc2_.length > 6)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - 6,_loc2_.length);
         }
         if(_loc2_ == var_336)
         {
            return;
         }
         var_336 = _loc2_;
         showInterface();
      }
      
      override protected function sendDelete() : void
      {
         hideInterface(false);
      }
   }
}
