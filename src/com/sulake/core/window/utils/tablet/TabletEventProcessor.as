package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3023:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_82 = param1.desktop;
         var_61 = param1.var_1342 as WindowController;
         var_172 = param1.var_1341 as WindowController;
         var_162 = param1.renderer;
         var_880 = param1.var_1344;
         param2.begin();
         param2.end();
         param1.desktop = var_82;
         param1.var_1342 = var_61;
         param1.var_1341 = var_172;
         param1.renderer = var_162;
         param1.var_1344 = var_880;
      }
   }
}
