package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_185:String;
      
      private var _text:ITextWindow;
      
      private var var_291:int;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function test(param1:int) : Boolean
      {
         this._text.text = this.var_185.substring(0,param1) + "...";
         return this._text.textHeight > this.var_291;
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         this.var_185 = param1;
         this._text = param2;
         this.var_291 = param3;
      }
   }
}
