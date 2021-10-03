package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2449:int;
      
      private var var_1953:String;
      
      private var var_2453:String;
      
      private var var_2451:Boolean;
      
      private var var_2447:Boolean;
      
      private var var_2450:int;
      
      private var var_2448:String;
      
      private var var_2452:String;
      
      private var var_1743:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2449 = param1.readInteger();
         this.var_1953 = param1.readString();
         this.var_2453 = param1.readString();
         this.var_2451 = param1.readBoolean();
         this.var_2447 = param1.readBoolean();
         param1.readString();
         this.var_2450 = param1.readInteger();
         this.var_2448 = param1.readString();
         this.var_2452 = param1.readString();
         this.var_1743 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2449;
      }
      
      public function get avatarName() : String
      {
         return this.var_1953;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2453;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2451;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2447;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2450;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2448;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2452;
      }
      
      public function get realName() : String
      {
         return this.var_1743;
      }
   }
}
