package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2042:String = "";
      
      private var var_1658:String = "";
      
      private var var_2421:String = "";
      
      private var var_2422:Number = 0;
      
      private var var_2424:Number = 0;
      
      private var var_2423:Number = 0;
      
      private var var_2420:Number = 0;
      
      private var var_2181:Boolean = false;
      
      private var var_2180:Boolean = false;
      
      private var var_2182:Boolean = false;
      
      private var var_2183:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2042 = param2;
         this.var_1658 = param3;
         this.var_2421 = param4;
         this.var_2422 = param5;
         this.var_2424 = param6;
         this.var_2423 = param7;
         this.var_2420 = param8;
         this.var_2181 = param9;
         this.var_2180 = param10;
         this.var_2182 = param11;
         this.var_2183 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2042;
      }
      
      public function get canvasId() : String
      {
         return this.var_1658;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2421;
      }
      
      public function get screenX() : Number
      {
         return this.var_2422;
      }
      
      public function get screenY() : Number
      {
         return this.var_2424;
      }
      
      public function get localX() : Number
      {
         return this.var_2423;
      }
      
      public function get localY() : Number
      {
         return this.var_2420;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2181;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2180;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2182;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2183;
      }
   }
}
