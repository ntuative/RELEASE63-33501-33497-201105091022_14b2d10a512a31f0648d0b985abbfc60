package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_133:Stage;
      
      private static var var_303:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_773:Boolean = true;
      
      private static var var_112:DisplayObject;
      
      private static var var_1455:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_133 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_112)
            {
               var_133.removeChild(var_112);
               var_133.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_133.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_133.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_133.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_773 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_303;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_303 = param1;
         if(var_303)
         {
            if(var_112)
            {
               var_112.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_112)
         {
            var_112.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_773)
         {
            _loc1_ = var_1455[_type];
            if(_loc1_)
            {
               if(var_112)
               {
                  var_133.removeChild(var_112);
               }
               else
               {
                  var_133.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_133.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_133.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_133.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_112 = _loc1_;
               var_133.addChild(var_112);
            }
            else
            {
               if(var_112)
               {
                  var_133.removeChild(var_112);
                  var_133.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_133.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_133.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_133.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_112 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_356:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_746:
                  case MouseCursorType.const_253:
                  case MouseCursorType.const_1854:
                  case MouseCursorType.const_1834:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_773 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1455[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_112)
         {
            var_112.x = param1.stageX - 2;
            var_112.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_303 = false;
               Mouse.show();
            }
            else
            {
               var_303 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_112 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_303 = false;
         }
      }
   }
}
