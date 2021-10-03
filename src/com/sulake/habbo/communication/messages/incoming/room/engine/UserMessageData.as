package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1152:String = "M";
      
      public static const const_1743:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_433:int = 0;
      
      private var _name:String = "";
      
      private var var_1644:int = 0;
      
      private var var_908:String = "";
      
      private var var_614:String = "";
      
      private var var_2432:String = "";
      
      private var var_2189:int;
      
      private var var_2257:int = 0;
      
      private var var_2429:String = "";
      
      private var var_2430:int = 0;
      
      private var var_2262:int = 0;
      
      private var var_2431:String = "";
      
      private var var_175:Boolean = false;
      
      public function UserMessageData(param1:int)
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
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_175)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1644;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_1644 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_908;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_908 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_614 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2432;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2432 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2189;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2189 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2257;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2257 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2429;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2429 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2430;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2430 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2262;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_175)
         {
            this.var_2262 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2431;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_175)
         {
            this.var_2431 = param1;
         }
      }
   }
}
