package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_205;
         param1["bound_to_parent_rect"] = const_107;
         param1["child_window"] = const_1133;
         param1["embedded_controller"] = const_1265;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_797;
         param1["mouse_dragging_target"] = const_293;
         param1["mouse_dragging_trigger"] = const_386;
         param1["mouse_scaling_target"] = const_362;
         param1["mouse_scaling_trigger"] = const_584;
         param1["horizontal_mouse_scaling_trigger"] = const_289;
         param1["vertical_mouse_scaling_trigger"] = const_242;
         param1["observe_parent_input_events"] = const_1160;
         param1["optimize_region_to_layout_size"] = const_555;
         param1["parent_window"] = const_1285;
         param1["relative_horizontal_scale_center"] = const_203;
         param1["relative_horizontal_scale_fixed"] = const_150;
         param1["relative_horizontal_scale_move"] = const_398;
         param1["relative_horizontal_scale_strech"] = const_448;
         param1["relative_scale_center"] = const_1246;
         param1["relative_scale_fixed"] = const_752;
         param1["relative_scale_move"] = const_1159;
         param1["relative_scale_strech"] = const_1157;
         param1["relative_vertical_scale_center"] = const_221;
         param1["relative_vertical_scale_fixed"] = const_165;
         param1["relative_vertical_scale_move"] = const_299;
         param1["relative_vertical_scale_strech"] = const_324;
         param1["on_resize_align_left"] = const_860;
         param1["on_resize_align_right"] = const_514;
         param1["on_resize_align_center"] = const_532;
         param1["on_resize_align_top"] = const_824;
         param1["on_resize_align_bottom"] = const_510;
         param1["on_resize_align_middle"] = const_583;
         param1["on_accommodate_align_left"] = const_1175;
         param1["on_accommodate_align_right"] = const_563;
         param1["on_accommodate_align_center"] = const_748;
         param1["on_accommodate_align_top"] = const_1270;
         param1["on_accommodate_align_bottom"] = const_617;
         param1["on_accommodate_align_middle"] = const_861;
         param1["route_input_events_to_parent"] = const_605;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1113;
         param1["scalable_with_mouse"] = const_1220;
         param1["reflect_horizontal_resize_to_parent"] = const_610;
         param1["reflect_vertical_resize_to_parent"] = const_537;
         param1["reflect_resize_to_parent"] = const_331;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1244;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
