package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_919;
         param1["bitmap"] = const_742;
         param1["border"] = const_849;
         param1["border_notify"] = const_1620;
         param1["button"] = const_553;
         param1["button_thick"] = const_760;
         param1["button_icon"] = const_1815;
         param1["button_group_left"] = const_921;
         param1["button_group_center"] = const_931;
         param1["button_group_right"] = const_761;
         param1["canvas"] = const_773;
         param1["checkbox"] = const_963;
         param1["closebutton"] = const_1134;
         param1["container"] = const_444;
         param1["container_button"] = const_785;
         param1["display_object_wrapper"] = const_847;
         param1["dropmenu"] = const_492;
         param1["dropmenu_item"] = const_616;
         param1["frame"] = const_417;
         param1["frame_notify"] = const_1685;
         param1["header"] = const_770;
         param1["html"] = const_1154;
         param1["icon"] = const_1149;
         param1["itemgrid"] = const_1253;
         param1["itemgrid_horizontal"] = const_570;
         param1["itemgrid_vertical"] = const_985;
         param1["itemlist"] = const_1197;
         param1["itemlist_horizontal"] = const_421;
         param1["itemlist_vertical"] = const_423;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1724;
         param1["menu"] = const_1761;
         param1["menu_item"] = const_1686;
         param1["submenu"] = const_1280;
         param1["minimizebox"] = const_1597;
         param1["notify"] = const_1775;
         param1["null"] = const_972;
         param1["password"] = const_920;
         param1["radiobutton"] = const_829;
         param1["region"] = const_561;
         param1["restorebox"] = const_1639;
         param1["scaler"] = const_644;
         param1["scaler_horizontal"] = const_1742;
         param1["scaler_vertical"] = const_1741;
         param1["scrollbar_horizontal"] = const_518;
         param1["scrollbar_vertical"] = const_956;
         param1["scrollbar_slider_button_up"] = const_1104;
         param1["scrollbar_slider_button_down"] = const_1195;
         param1["scrollbar_slider_button_left"] = const_1102;
         param1["scrollbar_slider_button_right"] = const_1238;
         param1["scrollbar_slider_bar_horizontal"] = const_1185;
         param1["scrollbar_slider_bar_vertical"] = const_1146;
         param1["scrollbar_slider_track_horizontal"] = const_1138;
         param1["scrollbar_slider_track_vertical"] = const_1304;
         param1["scrollable_itemlist"] = const_1772;
         param1["scrollable_itemlist_vertical"] = const_477;
         param1["scrollable_itemlist_horizontal"] = const_1203;
         param1["selector"] = const_859;
         param1["selector_list"] = const_816;
         param1["submenu"] = const_1280;
         param1["tab_button"] = const_882;
         param1["tab_container_button"] = const_1174;
         param1["tab_context"] = const_415;
         param1["tab_content"] = const_1211;
         param1["tab_selector"] = const_730;
         param1["text"] = const_490;
         param1["input"] = const_966;
         param1["toolbar"] = const_1858;
         param1["tooltip"] = const_380;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
