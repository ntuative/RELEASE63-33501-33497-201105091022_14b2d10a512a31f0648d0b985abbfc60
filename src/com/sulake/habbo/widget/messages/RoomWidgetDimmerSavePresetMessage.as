package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_886:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2435:int;
      
      private var var_2436:int;
      
      private var _color:uint;
      
      private var var_1245:int;
      
      private var var_2602:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_886);
         this.var_2435 = param1;
         this.var_2436 = param2;
         this._color = param3;
         this.var_1245 = param4;
         this.var_2602 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2435;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2436;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1245;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2602;
      }
   }
}
