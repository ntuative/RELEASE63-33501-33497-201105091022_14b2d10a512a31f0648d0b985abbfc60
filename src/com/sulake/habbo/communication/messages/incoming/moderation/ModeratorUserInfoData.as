package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2479:int;
      
      private var var_2481:int;
      
      private var var_821:Boolean;
      
      private var var_2477:int;
      
      private var var_2476:int;
      
      private var var_2478:int;
      
      private var var_2480:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2479 = param1.readInteger();
         this.var_2481 = param1.readInteger();
         this.var_821 = param1.readBoolean();
         this.var_2477 = param1.readInteger();
         this.var_2476 = param1.readInteger();
         this.var_2478 = param1.readInteger();
         this.var_2480 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2479;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2481;
      }
      
      public function get online() : Boolean
      {
         return this.var_821;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2477;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2476;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2478;
      }
      
      public function get banCount() : int
      {
         return this.var_2480;
      }
   }
}
