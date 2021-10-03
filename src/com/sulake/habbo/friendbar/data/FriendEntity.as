package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_821:Boolean;
      
      private var var_2094:Boolean;
      
      private var var_614:String;
      
      private var var_1572:int;
      
      private var var_1742:String;
      
      private var var_1744:String;
      
      private var var_1743:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1743 = param3;
         this.var_1742 = param4;
         this.var_933 = param5;
         this.var_821 = param6;
         this.var_2094 = param7;
         this.var_614 = param8;
         this.var_1572 = param9;
         this.var_1744 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_933;
      }
      
      public function get online() : Boolean
      {
         return this.var_821;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_2094;
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function get categoryId() : int
      {
         return this.var_1572;
      }
      
      public function get motto() : String
      {
         return this.var_1742;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1744;
      }
      
      public function get realName() : String
      {
         return this.var_1743;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_933 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_821 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2094 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_614 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1572 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1742 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1744 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1743 = param1;
      }
   }
}
