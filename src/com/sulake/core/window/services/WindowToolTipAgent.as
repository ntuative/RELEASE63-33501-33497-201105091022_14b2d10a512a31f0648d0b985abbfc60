package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1365:String;
      
      protected var var_288:IToolTipWindow;
      
      protected var var_409:Timer;
      
      protected var var_1366:Point;
      
      protected var var_1364:Point;
      
      protected var var_1645:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1364 = new Point();
         this.var_1366 = new Point(20,20);
         this.var_1645 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1365 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1645 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1365 = param1.caption;
               this.var_1645 = 500;
            }
            _mouse.x = var_148.mouseX;
            _mouse.y = var_148.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1364);
            if(this.var_1365 != null && this.var_1365 != "")
            {
               if(this.var_409 == null)
               {
                  this.var_409 = new Timer(this.var_1645,1);
                  this.var_409.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_409.reset();
               this.var_409.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_409 != null)
         {
            this.var_409.stop();
            this.var_409.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_409 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1364);
            if(this.var_288 != null && !this.var_288.disposed)
            {
               this.var_288.x = param1 + this.var_1366.x;
               this.var_288.y = param2 + this.var_1366.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_409 != null)
         {
            this.var_409.reset();
         }
         if(_window && true)
         {
            if(this.var_288 == null || this.var_288.disposed)
            {
               this.var_288 = _window.context.create("undefined::ToolTip",this.var_1365,WindowType.const_380,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_288.x = _loc2_.x + this.var_1364.x + this.var_1366.x;
            this.var_288.y = _loc2_.y + this.var_1364.y + this.var_1366.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_288 != null && !this.var_288.disposed)
         {
            this.var_288.destroy();
            this.var_288 = null;
         }
      }
   }
}
