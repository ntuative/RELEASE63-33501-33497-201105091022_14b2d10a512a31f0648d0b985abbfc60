package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Badge implements IThumbListDrawableItem
   {
       
      
      private var _type:String;
      
      private var var_1820:Boolean;
      
      private var _isSelected:Boolean;
      
      private var var_45:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1565:IWindow;
      
      private const const_2194:int = 8947848;
      
      private const const_2193:int = 13421772;
      
      public function Badge(param1:String, param2:IWindowContainer)
      {
         this.var_45 = new BitmapData(1,1,false,4278255360);
         super();
         this._type = param1;
         this._window = param2;
         this.var_1565 = this._window.findChildByTag("BG_COLOR");
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1820;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_45;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1820 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         if(this.var_1565 == null)
         {
            return;
         }
         if(param1)
         {
            this.var_1565.color = this.const_2194;
         }
         else
         {
            this.var_1565.color = this.const_2193;
         }
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_45 = param1;
         if(this.var_45 == null)
         {
            return;
         }
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         param1 = this.var_45;
         var _loc3_:BitmapData = !!_loc2_.bitmap ? _loc2_.bitmap : new BitmapData(_loc2_.width,_loc2_.height);
         _loc3_.fillRect(_loc3_.rect,0);
         _loc3_.copyPixels(param1,param1.rect,new Point(_loc3_.width / 2 - param1.width / 2,_loc3_.height / 2 - param1.height / 2));
         _loc2_.bitmap = _loc3_;
      }
   }
}
