package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_66:EffectsModel;
      
      private var var_343:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_66 = param1;
         this.var_343 = param2;
      }
      
      public function dispose() : void
      {
         this.var_66 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_66.getEffects(this.var_343);
      }
   }
}
