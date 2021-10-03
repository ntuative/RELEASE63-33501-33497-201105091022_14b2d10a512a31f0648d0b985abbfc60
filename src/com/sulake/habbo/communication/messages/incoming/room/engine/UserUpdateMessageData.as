package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_2865:Number = 0;
      
      private var var_2864:Number = 0;
      
      private var var_2866:Number = 0;
      
      private var var_2867:Number = 0;
      
      private var var_433:int = 0;
      
      private var var_2583:int = 0;
      
      private var var_334:Array;
      
      private var var_2868:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_334 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_164 = param3;
         this.var_163 = param4;
         this.var_2865 = param5;
         this.var_433 = param6;
         this.var_2583 = param7;
         this.var_2864 = param8;
         this.var_2866 = param9;
         this.var_2867 = param10;
         this.var_2868 = param11;
         this.var_334 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_164;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function get localZ() : Number
      {
         return this.var_2865;
      }
      
      public function get targetX() : Number
      {
         return this.var_2864;
      }
      
      public function get targetY() : Number
      {
         return this.var_2866;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2867;
      }
      
      public function get dir() : int
      {
         return this.var_433;
      }
      
      public function get dirHead() : int
      {
         return this.var_2583;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2868;
      }
      
      public function get actions() : Array
      {
         return this.var_334.slice();
      }
   }
}
