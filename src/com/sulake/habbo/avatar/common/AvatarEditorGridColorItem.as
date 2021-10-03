package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarEditorGridColorItem
   {
       
      
      private var var_66:IAvatarEditorCategoryModel;
      
      private var _window:IWindowContainer;
      
      private var var_1058:IPartColor;
      
      private var _isSelected:Boolean = false;
      
      private var var_636:BitmapData;
      
      private var var_971:BitmapData;
      
      private var var_972:BitmapData;
      
      public function AvatarEditorGridColorItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IPartColor)
      {
         super();
         this.var_66 = param2;
         this._window = param1;
         this._window.background = true;
         this.var_1058 = param3;
         var _loc4_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_1") as BitmapDataAsset;
         this.var_636 = _loc4_.content as BitmapData;
         var _loc5_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_2") as BitmapDataAsset;
         this.var_971 = _loc5_.content as BitmapData;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_3") as BitmapDataAsset;
         this.var_972 = _loc6_.content as BitmapData;
         this.updateThumbData();
      }
      
      public function dispose() : void
      {
         this.var_66 = null;
         if(this._window != null)
         {
            if(!this._window.disposed)
            {
               this._window.dispose();
            }
         }
         this._window = null;
         this.var_1058 = null;
         this.var_636 = null;
         this.var_971 = null;
         this.var_972 = null;
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         this.updateThumbData();
      }
      
      private function updateThumbData() : void
      {
         var _loc5_:* = null;
         if(this._window == null)
         {
            return;
         }
         if(this._window.disposed)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = this._window.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(this.var_636.width,this.var_636.height,true,0);
            _loc1_.bitmap.copyPixels(this.var_636,this.var_636.rect,new Point(0,0));
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(this.var_971.width,this.var_971.height,true,0);
            _loc5_ = this.var_971.clone();
            _loc5_.colorTransform(_loc5_.rect,this.var_1058.colorTransform);
            _loc2_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(this._isSelected)
            {
               _loc3_.bitmap = new BitmapData(this.var_972.width,this.var_972.height,true,16777215);
               _loc3_.bitmap.copyPixels(this.var_972,this.var_972.rect,new Point(0,0),null,null,true);
               _loc3_.visible = true;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         var _loc4_:IIconWindow = this._window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc4_)
         {
            if(this.var_1058)
            {
               switch(this.var_1058.clubLevel)
               {
                  case HabboClubLevelEnum.const_56:
                     _loc4_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_45:
                     _loc4_.style = HabboIconType.const_808;
                     _loc4_.visible = true;
                     break;
                  case HabboClubLevelEnum.const_46:
                     _loc4_.style = HabboIconType.const_947;
                     _loc4_.visible = true;
               }
            }
            else
            {
               _loc4_.visible = false;
            }
         }
      }
      
      public function get partColor() : IPartColor
      {
         return this.var_1058;
      }
   }
}
