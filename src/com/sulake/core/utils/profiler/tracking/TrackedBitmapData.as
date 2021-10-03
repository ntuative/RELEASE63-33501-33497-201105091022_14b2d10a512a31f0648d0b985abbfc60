package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2155:int = 16777215;
      
      public static const const_1261:int = 8191;
      
      public static const const_1129:int = 8191;
      
      public static const const_2033:int = 1;
      
      public static const const_1275:int = 1;
      
      public static const const_1314:int = 1;
      
      private static var var_530:uint = 0;
      
      private static var var_531:uint = 0;
       
      
      private var var_421:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1261)
         {
            param2 = const_1261;
         }
         else if(param2 < const_1275)
         {
            param2 = const_1275;
         }
         if(param3 > const_1129)
         {
            param3 = const_1129;
         }
         else if(param3 < const_1314)
         {
            param3 = const_1314;
         }
         super(param2,param3,param4,param5);
         ++var_530;
         var_531 += param2 * param3 * 4;
         this.var_421 = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_530;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_531;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_531 -= width * height * 4;
            --var_530;
            this._disposed = true;
            this.var_421 = null;
            super.dispose();
         }
      }
   }
}
