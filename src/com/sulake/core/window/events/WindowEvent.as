package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1719:String = "WE_DESTROY";
      
      public static const const_369:String = "WE_DESTROYED";
      
      public static const const_1781:String = "WE_OPEN";
      
      public static const const_1651:String = "WE_OPENED";
      
      public static const const_1792:String = "WE_CLOSE";
      
      public static const const_1797:String = "WE_CLOSED";
      
      public static const const_1632:String = "WE_FOCUS";
      
      public static const const_307:String = "WE_FOCUSED";
      
      public static const const_1822:String = "WE_UNFOCUS";
      
      public static const const_1845:String = "WE_UNFOCUSED";
      
      public static const const_1820:String = "WE_ACTIVATE";
      
      public static const const_528:String = "WE_ACTIVATED";
      
      public static const const_1751:String = "WE_DEACTIVATE";
      
      public static const const_598:String = "WE_DEACTIVATED";
      
      public static const const_325:String = "WE_SELECT";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_557:String = "WE_UNSELECT";
      
      public static const const_623:String = "WE_UNSELECTED";
      
      public static const const_1878:String = "WE_LOCK";
      
      public static const const_1770:String = "WE_LOCKED";
      
      public static const const_1661:String = "WE_UNLOCK";
      
      public static const const_1846:String = "WE_UNLOCKED";
      
      public static const const_977:String = "WE_ENABLE";
      
      public static const const_254:String = "WE_ENABLED";
      
      public static const const_967:String = "WE_DISABLE";
      
      public static const const_214:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_250:String = "WE_RELOCATED";
      
      public static const const_1269:String = "WE_RESIZE";
      
      public static const const_38:String = "WE_RESIZED";
      
      public static const const_1726:String = "WE_MINIMIZE";
      
      public static const const_1764:String = "WE_MINIMIZED";
      
      public static const const_1831:String = "WE_MAXIMIZE";
      
      public static const const_1665:String = "WE_MAXIMIZED";
      
      public static const const_1802:String = "WE_RESTORE";
      
      public static const const_1788:String = "WE_RESTORED";
      
      public static const const_586:String = "WE_CHILD_ADDED";
      
      public static const const_408:String = "WE_CHILD_REMOVED";
      
      public static const const_206:String = "WE_CHILD_RELOCATED";
      
      public static const const_155:String = "WE_CHILD_RESIZED";
      
      public static const const_332:String = "WE_CHILD_ACTIVATED";
      
      public static const const_473:String = "WE_PARENT_ADDED";
      
      public static const const_1668:String = "WE_PARENT_REMOVED";
      
      public static const const_1779:String = "WE_PARENT_RELOCATED";
      
      public static const const_791:String = "WE_PARENT_RESIZED";
      
      public static const const_1207:String = "WE_PARENT_ACTIVATED";
      
      public static const const_172:String = "WE_OK";
      
      public static const const_642:String = "WE_CANCEL";
      
      public static const const_105:String = "WE_CHANGE";
      
      public static const const_494:String = "WE_SCROLL";
      
      public static const const_174:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_704:IWindow;
      
      protected var var_1093:Boolean;
      
      protected var var_478:Boolean;
      
      protected var var_481:Boolean;
      
      protected var var_705:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_704 = param3;
         _loc5_.var_478 = param4;
         _loc5_.var_481 = false;
         _loc5_.var_705 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_704;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_478;
      }
      
      public function recycle() : void
      {
         if(this.var_481)
         {
            throw new Error("Event already recycled!");
         }
         this.var_704 = null;
         this._window = null;
         this.var_481 = true;
         this.var_1093 = false;
         this.var_705.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1093;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1093 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1093;
      }
      
      public function stopPropagation() : void
      {
         this.var_1093 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1093 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_478 + " window: " + this._window + " }";
      }
   }
}
