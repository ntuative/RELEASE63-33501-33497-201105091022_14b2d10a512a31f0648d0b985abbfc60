package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_627:int = 1;
      
      public static const const_971:int = 2;
      
      public static const const_2010:int = 3;
      
      public static const const_1179:int = 4;
      
      private static const const_1077:int = 1;
      
      private static const const_682:int = 2;
      
      private static const const_1078:int = 3;
      
      private static const const_1548:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_15:IFrameWindow;
      
      private var var_186:IWindowContainer;
      
      private var var_230:IWindowContainer;
      
      private var var_273:IWindowContainer;
      
      private var var_211:IWindowContainer;
      
      private var var_1060:PopularTagsListCtrl;
      
      private var var_1059:GuestRoomListCtrl;
      
      private var var_1297:OfficialRoomListCtrl;
      
      private var var_242:ITabContextWindow;
      
      private var var_2030:Boolean;
      
      private var var_674:int;
      
      private var var_1298:Boolean = true;
      
      private var var_1576:int = 0;
      
      private var var_1577:IWindow;
      
      private var var_1299:IRegionWindow;
      
      private var var_2809:int = 0;
      
      private var var_510:Timer;
      
      private var _disposed:Boolean = false;
      
      private var var_842:WindowToggle;
      
      private const const_1090:Point = new Point(100,10);
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_1060 = new PopularTagsListCtrl(this._navigator);
         this.var_1059 = new GuestRoomListCtrl(this._navigator);
         this.var_1297 = new OfficialRoomListCtrl(this._navigator);
         this.var_510 = new Timer(300,1);
         this.var_510.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(!this.var_15)
         {
            this.reloadData();
            return true;
         }
         if(!this.var_842 || this.var_842.disposed)
         {
            this.var_842 = new WindowToggle(this.var_15,this.var_15.desktop,this.reloadData,this.close);
         }
         var _loc1_:int = this.var_842.toggle();
         return _loc1_ == WindowToggle.RESULT_SHOW;
      }
      
      private function reloadData() : void
      {
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this._navigator = null;
            if(this.var_15)
            {
               this.var_15.dispose();
               this.var_15 = null;
            }
            if(this.var_842)
            {
               this.var_842.dispose();
               this.var_842 = null;
            }
            if(this.var_186)
            {
               this.var_186.dispose();
               this.var_186 = null;
            }
            if(this.var_510)
            {
               this.var_510.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_510.reset();
               this.var_510 = null;
            }
            if(this.var_1060)
            {
               this.var_1060.dispose();
               this.var_1060 = null;
            }
            if(this.var_1059)
            {
               this.var_1059.dispose();
               this.var_1059 = null;
            }
            if(this.var_1297)
            {
               this.var_1297.dispose();
               this.var_1297 = null;
            }
         }
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_15 == null)
         {
            this.prepare();
            this.var_15.position = this.const_1090;
            _loc1_ = true;
         }
         this.refresh();
         this.var_15.visible = true;
         this.var_15.activate();
         if(_loc1_)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_57,HabboToolbarIconEnum.NAVIGATOR,this.var_15));
         }
      }
      
      public function isOpen() : Boolean
      {
         return this.var_15 != null && this.var_15.visible;
      }
      
      public function close() : void
      {
         if(this.var_15 != null)
         {
            this.var_15.visible = false;
         }
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return this.var_15;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._navigator)
         {
            ErrorReportStorage.addDebugData("MainViewCtrl","prepare: _navigator is null!");
         }
         this.var_15 = IFrameWindow(this._navigator.getXmlWindow("grs_main_window"));
         if(!this.var_15)
         {
            ErrorReportStorage.addDebugData("MainViewCtrl","prepare: _mainWindow is null!");
         }
         this.var_242 = ITabContextWindow(this.var_15.findChildByName("tab_context"));
         if(!this.var_242)
         {
            ErrorReportStorage.addDebugData("MainViewCtrl","prepare: _tabContext is null!");
         }
         this.var_186 = IWindowContainer(this.var_15.findChildByName("tab_content"));
         this.var_230 = IWindowContainer(this.var_15.findChildByName("custom_content"));
         this.var_211 = IWindowContainer(this.var_15.findChildByName("list_content"));
         this.var_273 = IWindowContainer(this.var_15.findChildByName("custom_footer"));
         this.var_1577 = this.var_15.findChildByName("loading_text");
         var _loc1_:IWindow = this.var_15.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_1299 = IRegionWindow(this.var_15.findChildByName("to_hotel_view"));
         if(!this.var_1299)
         {
            ErrorReportStorage.addDebugData("MainViewCtrl","prepare: _toHotelView is null!");
         }
         this.var_1299.procedure = this.onHotelView;
         this.refreshToHotelViewButton(false);
         this.var_15.procedure = this.onWindow;
         for each(_loc2_ in this._navigator.tabs.tabs)
         {
            _loc3_ = this.var_242.getTabItemByID(_loc2_.id);
            if(!_loc3_)
            {
               ErrorReportStorage.addDebugData("MainViewCtrl","prepare: but is null!");
            }
            _loc3_.setParamFlag(HabboWindowParam.const_40,true);
            _loc3_.procedure = this.onTabClick;
            _loc2_.button = _loc3_;
         }
         this.var_15.scaler.setParamFlag(HabboWindowParam.const_723,false);
         this.var_15.scaler.setParamFlag(HabboWindowParam.const_1738,true);
      }
      
      public function refresh() : void
      {
         if(this.var_15 == null)
         {
            return;
         }
         this.refreshTab();
         this.refreshCustomContent();
         this.refreshListContent(true);
         this.refreshFooter();
         this.var_230.height = Util.getLowestPoint(this.var_230);
         this.var_273.height = Util.getLowestPoint(this.var_273);
         var _loc1_:int = this.var_211.y;
         Util.moveChildrenToColumn(this.var_186,["custom_content","list_content"],this.var_230.y,8);
         this.var_211.height = this.var_211.height + _loc1_ - this.var_211.y - this.var_273.height + this.var_2809;
         Util.moveChildrenToColumn(this.var_186,["list_content","custom_footer"],this.var_211.y,0);
         this.var_2809 = this.var_273.height;
         this.onResizeTimer(null);
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = this.var_242.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            this.var_2030 = true;
            this.var_242.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(this.var_230);
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(this.var_230);
         if(Util.hasVisibleChildren(this.var_230))
         {
            this.var_230.visible = true;
         }
         else
         {
            this.var_230.visible = false;
            this.var_230.blend = 1;
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(this.var_273);
         var _loc1_:Tab = this._navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(this.var_273);
         if(Util.hasVisibleChildren(this.var_273))
         {
            this.var_273.visible = true;
         }
         else
         {
            this.var_273.visible = false;
         }
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(this.var_211);
         this.refreshGuestRooms(param1,this._navigator.data.guestRoomSearchArrived);
         this.refreshPopularTags(param1,this._navigator.data.popularTagsArrived);
         this.refreshOfficialRooms(param1,this._navigator.data.officialRoomsArrived);
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1059,"guest_rooms");
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1060,"popular_tags");
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         this.refreshList(param1,param2,this.var_1297,"official_rooms");
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = this.var_211.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_58)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(this.var_2030)
         {
            this.var_2030 = false;
            return;
         }
         var _loc4_:Tab = this._navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_440:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_337:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_426:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_277:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_288:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            this.startSearch(this._navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = this._navigator.tabs.getSelected();
         this._navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = this._navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1298 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         this._navigator.data.startLoading();
         if(param4 == const_627)
         {
            this._navigator.send(this.getSearchMsg(param2,param3));
         }
         else if(param4 == const_971)
         {
            this._navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            this._navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!this.isOpen())
         {
            this.open();
            this.var_674 = const_682;
            this.var_211.blend = 0;
            if(this.var_230.visible)
            {
               this.var_230.blend = 0;
               this.var_273.blend = 0;
            }
         }
         else
         {
            this.var_674 = const_1077;
         }
         this.var_1576 = 0;
         this._navigator.registerUpdateReceiver(this,2);
         this.sendTrackingEvent(param2);
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_631:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_933:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_706:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_758:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_275:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_750:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_402:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_820:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_842:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_414:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_294:
               this._navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_933)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_706)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_758)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_275)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_402)
         {
            return new PopularRoomsSearchMessageComposer(param2,this._navigator.data.adIndex);
         }
         if(param1 == Tabs.const_820)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_842)
         {
            return new RoomsWithHighestScoreSearchMessageComposer(this._navigator.data.adIndex);
         }
         if(param1 == Tabs.const_414)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_294)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_631)
         {
            return new LatestEventsSearchMessageComposer(param2,this._navigator.data.adIndex);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_211 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(this.var_674 == const_1077)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_211.blend - _loc2_));
            this.var_211.blend = _loc3_;
            this.var_230.blend = !!this.var_1298 ? Number(_loc3_) : Number(1);
            this.var_273.blend = !!this.var_1298 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               this.var_674 = const_682;
            }
         }
         else if(this.var_674 == const_682)
         {
            if(this.var_1576 % 10 == 1)
            {
               this.var_1577.visible = !this.var_1577.visible;
            }
            ++this.var_1576;
            if(!this._navigator.data.isLoading())
            {
               this.var_674 = const_1078;
            }
         }
         else if(this.var_674 == const_1078)
         {
            this.refresh();
            this.var_674 = const_1548;
         }
         else
         {
            this.var_1577.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_211.blend + _loc2_));
            this.var_211.blend = _loc3_;
            this.var_230.blend = !!this.var_1298 ? Number(_loc3_) : Number(1);
            this.var_273.blend = !!this.var_1298 ? Number(_loc3_) : Number(1);
            if(this.var_211.blend >= 1)
            {
               this._navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_38 || param2 != this.var_15)
         {
            return;
         }
         if(!this.var_510.running)
         {
            this.var_510.reset();
            this.var_510.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         this.refreshScrollbar(this.var_1060);
         this.refreshScrollbar(this.var_1059);
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         this._navigator.refreshButton(this.var_1299,"icon_hotelview",!param1,null,0);
         this._navigator.refreshButton(this.var_1299,"icon_hotelview_reactive",param1,null,0);
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            this.refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._navigator.send(new QuitMessageComposer());
         }
      }
   }
}
