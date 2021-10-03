package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class FriendEntityTab extends Tab
   {
      
      private static const const_1550:String = "entity_xml";
      
      private static const const_1552:String = "facebook_piece_xml";
      
      private static const const_1551:String = "controls_piece_xml";
      
      private static const const_457:String = "list";
      
      private static const const_684:String = "header";
      
      private static const const_1081:String = "facebook";
      
      private static const const_1083:String = "controls";
      
      private static const const_685:String = "canvas";
      
      private static const const_469:String = "name";
      
      private static const const_1082:String = "btn_message";
      
      private static const const_1080:String = "btn_visit";
      
      private static const const_1014:String = "icon";
      
      private static const POOL:Array = [];
      
      private static const const_460:Array = [];
       
      
      private var var_325:IFriendEntity;
      
      public function FriendEntityTab()
      {
         super();
      }
      
      public static function allocate(param1:IFriendEntity) : FriendEntityTab
      {
         var _loc2_:FriendEntityTab = false ? POOL.pop() : new FriendEntityTab();
         _loc2_.var_481 = false;
         _loc2_.friend = param1;
         return _loc2_;
      }
      
      private static function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(const_457));
         _loc3_ = _loc2_.getListItemByName(const_1081) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_1083) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         param1.height = name_1;
         param1.y = 0;
      }
      
      public function set friend(param1:IFriendEntity) : void
      {
         this.var_325 = param1;
         this.refresh();
      }
      
      public function get friend() : IFriendEntity
      {
         return this.var_325;
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_481)
            {
               if(_window)
               {
                  this.releaseEntityWindow(_window);
                  _window = null;
               }
               this.var_325 = null;
               var_481 = true;
               POOL.push(this);
            }
         }
      }
      
      override public function select() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!selected)
         {
            _loc1_ = IItemListWindow(window.getChildByName(const_457));
            if(this.friend.realName != null && this.friend.realName != "")
            {
               _loc2_ = var_1345.buildFromXML(var_870.getAssetByName(const_1552).content as XML) as IWindowContainer;
               _loc2_.name = const_1081;
               _loc2_.getChildByName(const_469).caption = this.friend.realName;
               CROPPER.crop(_loc2_.getChildByName(const_469) as ITextWindow);
               _loc3_ = IBitmapWrapperWindow(_loc2_.getChildByName(const_1014));
               _loc3_.bitmap = var_870.getAssetByName(_loc3_.bitmapAssetName).content as BitmapData;
               _loc3_.width = _loc3_.bitmap.width;
               _loc3_.height = _loc3_.bitmap.height;
               _loc1_.addListItem(_loc2_);
            }
            if(this.friend.online)
            {
               _loc2_ = var_1345.buildFromXML(var_870.getAssetByName(const_1551).content as XML) as IWindowContainer;
               _loc2_.name = const_1083;
               _loc4_ = _loc2_.getChildByName(const_1082);
               if(_loc4_)
               {
                  _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                  _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseHover);
               }
               _loc4_ = _loc2_.getChildByName(const_1080);
               if(_loc4_)
               {
                  if(this.friend.allowFollow)
                  {
                     _loc4_.visible = true;
                     _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                     _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseHover);
                  }
                  else
                  {
                     _loc4_.visible = false;
                  }
               }
               _loc1_.addListItem(_loc2_);
            }
            window.height = _loc1_.height;
            window.y = name_1 - 0;
            super.select();
         }
      }
      
      override public function deselect() : void
      {
         if(selected)
         {
            if(_window)
            {
               purgeEntityPieces(_window);
            }
            super.deselect();
         }
      }
      
      protected function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _window = this.allocateEntityWindow();
         }
         if(this.var_325)
         {
            _window.id = this.var_325.id;
            _loc1_ = IItemListWindow(_window.getChildByName(const_457)).getListItemByName(const_684) as IWindowContainer;
            _loc1_.findChildByName(const_469).caption = this.var_325.name;
            CROPPER.crop(_loc1_.getChildByName(const_469) as ITextWindow);
            _loc2_ = IBitmapWrapperWindow(_loc1_.findChildByName(const_685));
            _loc2_.bitmap = var_1636.getAvatarFaceBitmap(this.var_325.figure);
            _loc2_.width = _loc2_.bitmap.width;
            _loc2_.height = _loc2_.bitmap.height;
         }
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_460.pop() : var_1345.buildFromXML(var_870.getAssetByName(const_1550).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_685));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_684));
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_5;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseHover);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseHover);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseHover);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseHover);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseHover);
            _loc2_ = IRegionWindow(param1.findChildByName(const_684));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseHover);
            param1.width = name_5;
            param1.height = name_1;
            _loc3_ = IBitmapWrapperWindow(param1.findChildByName(const_685));
            _loc3_.bitmap = null;
            purgeEntityPieces(param1);
            if(const_460.indexOf(param1) == -1)
            {
               const_460.push(param1);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            switch(param1.window.name)
            {
               case const_1082:
                  if(var_1087 && this.var_325)
                  {
                     var_1087.startConversation(this.var_325.id);
                     this.deselect();
                  }
                  break;
               case const_1080:
                  if(var_1087 && this.var_325)
                  {
                     var_1087.followToRoom(this.var_325.id);
                     this.deselect();
                  }
            }
         }
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " " + this.var_325.name;
      }
   }
}
