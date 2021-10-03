package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendRequestEvent extends Event
   {
      
      public static const const_1252:String = "FBE_REQUESTS";
       
      
      public function FriendRequestEvent()
      {
         super(const_1252,false,false);
      }
   }
}
