package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStructList implements IDisposable
   {
       
      
      private var _list:Array;
      
      function InterfaceStructList()
      {
         this._list = new Array();
         super();
      }
      
      public function get length() : uint
      {
         return this._list.length;
      }
      
      public function get disposed() : Boolean
      {
         return this._list == null;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc1_:uint = this._list.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this._list.pop();
            _loc2_.dispose();
            _loc3_++;
         }
         this._list = null;
      }
      
      public function insert(param1:InterfaceStruct) : uint
      {
         this._list.push(param1);
         return this._list.length;
      }
      
      public function remove(param1:uint) : InterfaceStruct
      {
         var _loc2_:* = null;
         if(param1 < this._list.length)
         {
            _loc2_ = this._list[param1];
            this._list.splice(param1,1);
            return _loc2_;
         }
         throw new Error("Index out of range!");
      }
      
      public function find(param1:IID) : IUnknown
      {
         var _loc4_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:uint = this._list.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = this._list[_loc5_] as InterfaceStruct;
            if(_loc4_.iis == _loc2_)
            {
               return _loc4_.unknown;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getStructByInterface(param1:IID) : InterfaceStruct
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc4_:uint = this._list.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this._list[_loc5_] as InterfaceStruct;
            if(_loc3_.iis == _loc2_)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getIndexByInterface(param1:IID) : int
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc4_:uint = this._list.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this._list[_loc5_] as InterfaceStruct;
            if(_loc3_.iis == _loc2_)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public function method_9(param1:IID, param2:Array) : uint
      {
         var _loc5_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:int = 0;
         var _loc6_:uint = this._list.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc5_ = this._list[_loc7_] as InterfaceStruct;
            if(_loc5_.iis == _loc3_)
            {
               param2.push(_loc5_);
               _loc4_++;
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      public function getStructByImplementor(param1:IUnknown) : InterfaceStruct
      {
         var _loc2_:* = null;
         var _loc3_:uint = this._list.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this._list[_loc4_] as InterfaceStruct;
            if(_loc2_.unknown == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getIndexByImplementor(param1:IUnknown) : int
      {
         var _loc2_:* = null;
         var _loc3_:uint = this._list.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this._list[_loc4_] as InterfaceStruct;
            if(_loc2_.unknown == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function mapStructsByImplementor(param1:IUnknown, param2:Array) : uint
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:uint = this._list.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this._list[_loc6_] as InterfaceStruct;
            if(_loc4_.unknown == param1)
            {
               param2.push(_loc4_);
               _loc3_++;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getStructByIndex(param1:uint) : InterfaceStruct
      {
         return param1 < this._list.length ? this._list[param1] : null;
      }
      
      public function getTotalReferenceCount() : uint
      {
         var _loc2_:* = null;
         var _loc1_:* = 0;
         var _loc3_:uint = this._list.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this._list[_loc4_] as InterfaceStruct;
            _loc1_ += _loc2_.references;
            _loc4_++;
         }
         return _loc1_;
      }
   }
}
