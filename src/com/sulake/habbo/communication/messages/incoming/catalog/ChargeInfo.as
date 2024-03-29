package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2587:int;
      
      private var var_2777:int;
      
      private var var_1129:int;
      
      private var var_1128:int;
      
      private var var_1718:int;
      
      private var var_2776:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2587 = param1.readInteger();
         this.var_2777 = param1.readInteger();
         this.var_1129 = param1.readInteger();
         this.var_1128 = param1.readInteger();
         this.var_1718 = param1.readInteger();
         this.var_2776 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2587;
      }
      
      public function get charges() : int
      {
         return this.var_2777;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1129;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1128;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2776;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1718;
      }
   }
}
