package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_433:int = 0;
      
      private var var_511:int = 0;
      
      private var var_610:int = 0;
      
      private var _type:int = 0;
      
      private var var_3014:String = "";
      
      private var var_1451:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2188:int = 0;
      
      private var var_2187:String = null;
      
      private var var_175:Boolean = false;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_175 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_175)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_164;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_175)
         {
            this.var_164 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_175)
         {
            this.var_163 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_433;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_433 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_511;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_511 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_610;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_610 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_175)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_175)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_175)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2187;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2187 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1451;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_1451 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2188;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2188 = param1;
         }
      }
   }
}
