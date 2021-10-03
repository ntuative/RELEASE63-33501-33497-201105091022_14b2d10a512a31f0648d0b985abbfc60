package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_2038:int;
      
      private var var_1500:int;
      
      private var var_2308:int;
      
      private var var_2302:int;
      
      private var var_2310:int;
      
      private var _energy:int;
      
      private var var_2305:int;
      
      private var _nutrition:int;
      
      private var var_2309:int;
      
      private var var_2304:int;
      
      private var _ownerName:String;
      
      private var var_2207:int;
      
      private var var_494:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_2038;
      }
      
      public function get level() : int
      {
         return this.var_1500;
      }
      
      public function get levelMax() : int
      {
         return this.var_2308;
      }
      
      public function get experience() : int
      {
         return this.var_2302;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2310;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2305;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2309;
      }
      
      public function get ownerId() : int
      {
         return this.var_2304;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2207;
      }
      
      public function get age() : int
      {
         return this.var_494;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_2038 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1500 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2302 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2310 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2305 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2309 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2304 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2207 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_494 = param1;
      }
   }
}
