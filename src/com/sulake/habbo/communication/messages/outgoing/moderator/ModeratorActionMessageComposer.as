package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_2098:int = 0;
      
      public static const const_1864:int = 1;
      
      public static const const_1664:int = 0;
      
      public static const const_1614:int = 1;
      
      public static const const_2130:int = 2;
      
      public static const const_1777:int = 3;
      
      public static const const_1594:int = 4;
       
      
      private var var_31:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         this.var_31 = new Array();
         super();
         this.var_31.push(param1);
         this.var_31.push(param2);
         this.var_31.push(param3);
         this.var_31.push(param4);
         this.var_31.push(param5);
         this.var_31.push(param6);
         this.var_31.push(false);
         this.var_31.push(false);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_31;
      }
      
      public function dispose() : void
      {
         this.var_31 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
