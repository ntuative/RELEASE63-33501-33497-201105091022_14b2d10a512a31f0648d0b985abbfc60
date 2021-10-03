package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1531:IID;
      
      private var var_1937:String;
      
      private var var_106:IUnknown;
      
      private var var_818:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1531 = param1;
         this.var_1937 = getQualifiedClassName(this.var_1531);
         this.var_106 = param2;
         this.var_818 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1531;
      }
      
      public function get iis() : String
      {
         return this.var_1937;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_106;
      }
      
      public function get references() : uint
      {
         return this.var_818;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_106 == null;
      }
      
      public function dispose() : void
      {
         this.var_1531 = null;
         this.var_1937 = null;
         this.var_106 = null;
         this.var_818 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_818;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_818) : uint(0);
      }
   }
}
