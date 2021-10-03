package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1845:int;
      
      private var var_2873:int;
      
      private var var_844:int;
      
      private var var_522:Number;
      
      private var var_2872:Boolean;
      
      private var var_2871:int;
      
      private var var_2065:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_522);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2873 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2871 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2872 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_844;
         if(this.var_844 == 1)
         {
            this.var_522 = param1;
            this.var_1845 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_844);
            this.var_522 = this.var_522 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2872 && param3 - this.var_1845 >= this.var_2873)
         {
            this.var_844 = 0;
            if(this.var_2065 < this.var_2871)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_2065;
               this.var_1845 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
