package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2116:IID;
      
      private var var_1091:Boolean;
      
      private var var_1340:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2116 = param1;
         this.var_1340 = new Array();
         this.var_1091 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2116;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1091;
      }
      
      public function get receivers() : Array
      {
         return this.var_1340;
      }
      
      public function dispose() : void
      {
         if(!this.var_1091)
         {
            this.var_1091 = true;
            this.var_2116 = null;
            while(this.var_1340.length > 0)
            {
               this.var_1340.pop();
            }
            this.var_1340 = null;
         }
      }
   }
}
