package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_821:Boolean;
      
      private var var_1745:Boolean;
      
      private var var_614:String;
      
      private var var_1572:int;
      
      private var var_1742:String;
      
      private var var_1744:String;
      
      private var var_1743:String;
      
      private var var_2987:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_933 = param1.readInteger();
         this.var_821 = param1.readBoolean();
         this.var_1745 = param1.readBoolean();
         this.var_614 = param1.readString();
         this.var_1572 = param1.readInteger();
         this.var_1742 = param1.readString();
         this.var_1744 = param1.readString();
         this.var_1743 = param1.readString();
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
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1745;
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
      
      public function get facebookId() : String
      {
         return this.var_2987;
      }
   }
}
