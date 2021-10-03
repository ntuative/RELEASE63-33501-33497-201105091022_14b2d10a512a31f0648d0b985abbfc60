package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1112:int = 0;
       
      
      private var var_445:BitmapData = null;
      
      private var var_2109:String = "";
      
      private var var_303:Boolean = true;
      
      private var var_2184:String = "";
      
      private var var_2213:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_2211:String = "normal";
      
      private var var_1622:Boolean = false;
      
      private var var_1621:Boolean = false;
      
      private var _offset:Point;
      
      private var var_279:int = 0;
      
      private var _height:int = 0;
      
      private var var_1190:Number = 0;
      
      private var var_2214:Boolean = false;
      
      private var var_2212:Boolean = true;
      
      private var var_2215:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var _instanceId:int = 0;
      
      private var var_2216:Array = null;
      
      public function RoomObjectSprite()
      {
         this._offset = new Point(0,0);
         super();
         this._instanceId = var_1112++;
      }
      
      public function dispose() : void
      {
         this.var_445 = null;
         this.var_279 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_445;
      }
      
      public function get assetName() : String
      {
         return this.var_2109;
      }
      
      public function get visible() : Boolean
      {
         return this.var_303;
      }
      
      public function get tag() : String
      {
         return this.var_2184;
      }
      
      public function get alpha() : int
      {
         return this.var_2213;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_2211;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1621;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1622;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_279;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1190;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2214;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2212;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2215;
      }
      
      public function get instanceId() : int
      {
         return this._instanceId;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2216;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_279 = param1.width;
            this._height = param1.height;
         }
         this.var_445 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2109 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_303 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2184 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2213 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2211 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2216 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1622 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1621 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1190 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2214 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2212 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2215 = param1;
         ++this._updateID;
      }
   }
}
