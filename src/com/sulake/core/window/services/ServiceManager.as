package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2989:uint;
      
      private var var_148:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_270:IWindowContext;
      
      private var var_1204:IMouseDraggingService;
      
      private var var_1200:IMouseScalingService;
      
      private var var_1202:IMouseListenerService;
      
      private var var_1201:IFocusManagerService;
      
      private var var_1205:IToolTipAgentService;
      
      private var var_1203:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2989 = 0;
         this.var_148 = param2;
         this.var_270 = param1;
         this.var_1204 = new WindowMouseDragger(param2);
         this.var_1200 = new WindowMouseScaler(param2);
         this.var_1202 = new WindowMouseListener(param2);
         this.var_1201 = new FocusManager(param2);
         this.var_1205 = new WindowToolTipAgent(param2);
         this.var_1203 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1204 != null)
         {
            this.var_1204.dispose();
            this.var_1204 = null;
         }
         if(this.var_1200 != null)
         {
            this.var_1200.dispose();
            this.var_1200 = null;
         }
         if(this.var_1202 != null)
         {
            this.var_1202.dispose();
            this.var_1202 = null;
         }
         if(this.var_1201 != null)
         {
            this.var_1201.dispose();
            this.var_1201 = null;
         }
         if(this.var_1205 != null)
         {
            this.var_1205.dispose();
            this.var_1205 = null;
         }
         if(this.var_1203 != null)
         {
            this.var_1203.dispose();
            this.var_1203 = null;
         }
         this.var_148 = null;
         this.var_270 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1204;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1200;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1202;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1201;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1205;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1203;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
