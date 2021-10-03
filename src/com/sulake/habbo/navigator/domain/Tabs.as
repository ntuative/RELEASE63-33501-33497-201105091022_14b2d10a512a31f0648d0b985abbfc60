package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_440:int = 1;
      
      public static const const_277:int = 2;
      
      public static const const_337:int = 3;
      
      public static const const_426:int = 4;
      
      public static const const_288:int = 5;
      
      public static const const_402:int = 1;
      
      public static const const_842:int = 2;
      
      public static const const_706:int = 3;
      
      public static const const_820:int = 4;
      
      public static const const_275:int = 5;
      
      public static const const_933:int = 6;
      
      public static const const_758:int = 7;
      
      public static const const_294:int = 8;
      
      public static const const_414:int = 9;
      
      public static const const_1960:int = 10;
      
      public static const const_750:int = 11;
      
      public static const const_631:int = 12;
       
      
      private var var_431:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_431 = new Array();
         this.var_431.push(new Tab(this._navigator,const_440,const_631,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_627));
         this.var_431.push(new Tab(this._navigator,const_277,const_402,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_627));
         this.var_431.push(new Tab(this._navigator,const_426,const_750,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1179));
         this.var_431.push(new Tab(this._navigator,const_337,const_275,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_627));
         this.var_431.push(new Tab(this._navigator,const_288,const_294,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_971));
         this.setSelectedTab(const_440);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_426;
      }
      
      public function get tabs() : Array
      {
         return this.var_431;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_431)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_431)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_431)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
