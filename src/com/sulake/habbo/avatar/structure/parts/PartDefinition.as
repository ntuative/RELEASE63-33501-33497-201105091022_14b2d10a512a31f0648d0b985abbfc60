package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2442:String;
      
      private var var_1823:String;
      
      private var var_2443:String;
      
      private var var_1824:Boolean;
      
      private var var_1822:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2442 = String(param1["set-type"]);
         this.var_1823 = String(param1["flipped-set-type"]);
         this.var_2443 = String(param1["remove-set-type"]);
         this.var_1824 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1822 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1822;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1822 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2442;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1823;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2443;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1824;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1824 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1823 = param1;
      }
   }
}
