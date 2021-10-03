package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_908:String = "";
      
      private var var_614:String = "";
      
      private var var_2432:String = "";
      
      private var var_2189:int;
      
      private var var_2257:int = 0;
      
      private var var_2429:String = "";
      
      private var var_2430:int = 0;
      
      private var var_2262:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2189;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2189 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_908;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_908 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_614 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2432;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2432 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2257;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2257 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2429;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2429 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2430;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2430 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2262;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2262 = param1;
      }
   }
}
