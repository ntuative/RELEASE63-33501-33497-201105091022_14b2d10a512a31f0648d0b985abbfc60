package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class UserTagsReceivedEvent extends Event
   {
      
      public static const const_191:String = "UTRE_USER_TAGS_RECEIVED";
       
      
      private var _userId:int;
      
      private var var_878:Array;
      
      public function UserTagsReceivedEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_191,param3,param4);
         this._userId = param1;
         this.var_878 = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get tags() : Array
      {
         return this.var_878;
      }
   }
}
