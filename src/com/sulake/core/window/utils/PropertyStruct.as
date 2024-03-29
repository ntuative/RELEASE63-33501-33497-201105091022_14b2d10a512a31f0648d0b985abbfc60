package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_161:String = "hex";
      
      public static const const_43:String = "int";
      
      public static const const_272:String = "uint";
      
      public static const const_133:String = "Number";
      
      public static const const_39:String = "Boolean";
      
      public static const const_54:String = "String";
      
      public static const const_281:String = "Point";
      
      public static const const_246:String = "Rectangle";
      
      public static const const_160:String = "Array";
      
      public static const const_284:String = "Map";
       
      
      private var var_668:String;
      
      private var var_185:Object;
      
      private var _type:String;
      
      private var var_2779:Boolean;
      
      private var var_3005:Boolean;
      
      private var var_2778:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_668 = param1;
         this.var_185 = param2;
         this._type = param3;
         this.var_2779 = param4;
         this.var_3005 = param3 == const_284 || param3 == const_160 || param3 == const_281 || param3 == const_246;
         this.var_2778 = param5;
      }
      
      public function get key() : String
      {
         return this.var_668;
      }
      
      public function get value() : Object
      {
         return this.var_185;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2779;
      }
      
      public function get range() : Array
      {
         return this.var_2778;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_161:
               return "0x" + uint(this.var_185).toString(16);
            case const_39:
               return Boolean(this.var_185) == true ? "HabboCatalogCom_ctlg_infopage2" : "false";
            case const_281:
               return "Point(" + Point(this.var_185).x + ", " + Point(this.var_185).y + ")";
            case const_246:
               return "Rectangle(" + Rectangle(this.var_185).x + ", " + Rectangle(this.var_185).y + ", " + Rectangle(this.var_185).width + ", " + Rectangle(this.var_185).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_284:
               _loc3_ = this.var_185 as Map;
               _loc1_ = "<var key=\"" + this.var_668 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_160:
               _loc4_ = this.var_185 as Array;
               _loc1_ = "<var key=\"" + this.var_668 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_281:
               _loc5_ = this.var_185 as Point;
               _loc1_ = "<var key=\"" + this.var_668 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_246:
               _loc6_ = this.var_185 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_668 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_43 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_161:
               _loc1_ = "<var key=\"" + this.var_668 + "\" value=\"" + "0x" + uint(this.var_185).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_668 + "\" value=\"" + this.var_185 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
