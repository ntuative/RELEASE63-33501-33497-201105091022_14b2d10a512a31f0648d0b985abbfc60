package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2109:String;
      
      private var var_2482:String;
      
      private var var_445:BitmapDataAsset;
      
      private var var_1622:Boolean;
      
      private var var_1621:Boolean;
      
      private var var_2483:Boolean;
      
      private var _offsetX:int;
      
      private var var_1244:int;
      
      private var var_279:int;
      
      private var _height:int;
      
      private var var_722:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2109 = param1;
         this.var_2482 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_445 = _loc9_;
            this.var_722 = false;
         }
         else
         {
            this.var_445 = null;
            this.var_722 = true;
         }
         this.var_1622 = param4;
         this.var_1621 = param5;
         this._offsetX = param6;
         this.var_1244 = param7;
         this.var_2483 = param8;
      }
      
      public function dispose() : void
      {
         this.var_445 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_722 && this.var_445 != null)
         {
            _loc1_ = this.var_445.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_279 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_722 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1621;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1622;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_279;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2109;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2482;
      }
      
      public function get asset() : IAsset
      {
         return this.var_445;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2483;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1622)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1621)
         {
            return this.var_1244;
         }
         return -(this.height + this.var_1244);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1244;
      }
   }
}
