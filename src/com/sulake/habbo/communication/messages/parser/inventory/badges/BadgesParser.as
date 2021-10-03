package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class BadgesParser implements IMessageParser
   {
       
      
      private var var_1807:Array;
      
      private var var_1806:Array;
      
      public function BadgesParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         this.var_1807 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1807.push(param1.readString());
            _loc3_++;
         }
         this.var_1806 = new Array();
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.readInteger();
            _loc7_ = param1.readString();
            this.var_1806.push(_loc7_);
            _loc5_++;
         }
         return true;
      }
      
      public function getAllBadgeIds() : Array
      {
         return this.var_1807;
      }
      
      public function getActiveBadgeIds() : Array
      {
         return this.var_1806;
      }
   }
}
