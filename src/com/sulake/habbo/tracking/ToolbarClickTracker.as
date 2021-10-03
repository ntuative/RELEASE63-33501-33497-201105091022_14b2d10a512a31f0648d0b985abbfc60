package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1369:IHabboTracking;
      
      private var var_2019:Boolean = false;
      
      private var var_2632:int = 0;
      
      private var var_1922:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1369 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1369 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2019 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2632 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2019)
         {
            return;
         }
         ++this.var_1922;
         if(this.var_1922 <= this.var_2632)
         {
            this.var_1369.track("toolbar",param1);
         }
      }
   }
}
