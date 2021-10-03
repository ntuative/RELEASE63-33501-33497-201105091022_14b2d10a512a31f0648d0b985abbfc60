package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1251:int;
      
      private var var_2195:String;
      
      private var var_2194:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1251 = param1.readInteger();
         this.var_2195 = param1.readString();
         this.var_2194 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1251;
      }
      
      public function get requesterName() : String
      {
         return this.var_2195;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2194;
      }
   }
}
