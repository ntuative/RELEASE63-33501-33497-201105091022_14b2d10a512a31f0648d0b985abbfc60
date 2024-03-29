package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.recycler.FurniSlotItem;
   import com.sulake.habbo.catalog.recycler.IRecycler;
   import com.sulake.habbo.catalog.recycler.IRecyclerVisualization;
   import com.sulake.habbo.catalog.recycler.RecyclerLogic;
   import com.sulake.habbo.catalog.viewer.CatalogObjectMover;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class RecyclerCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener, IRecyclerVisualization
   {
       
      
      private var var_323:CatalogObjectMover;
      
      public function RecyclerCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function get recycler() : IRecycler
      {
         return page.viewer.catalog.getRecycler();
      }
      
      override public function dispose() : void
      {
         if(this.var_323 != null)
         {
            this.var_323.dispose();
            this.var_323 = null;
         }
         if(this.recycler != null)
         {
            this.recycler.cancel();
         }
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         if(this.recycler == null)
         {
            return false;
         }
         this.recycler.init(this);
         return true;
      }
      
      public function displayDisabledView() : void
      {
         var _loc1_:XML = this.getAssetXML("recyclerWidgetInactive");
         if(_loc1_ == null)
         {
            return;
         }
         window.buildFromXML(_loc1_);
         this.renderSlotGraphics();
         var _loc2_:ITextWindow = (window.parent as IWindowContainer).findChildByName("ctlg_header_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = page.viewer.catalog.localization.getKey("recycler.info.closed");
         }
      }
      
      public function displayTimeOutView(param1:int) : void
      {
         var _loc2_:String = String(int(param1 / 60));
         var _loc3_:String = String(param1 % 60);
         page.viewer.catalog.localization.registerParameter("recycler.alert.timeout","minutes",_loc2_);
         page.viewer.catalog.localization.registerParameter("recycler.alert.timeout","seconds",_loc3_);
         var _loc4_:XML = this.getAssetXML("recyclerWidgetTimeout");
         if(_loc4_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc4_));
         var _loc5_:ITextWindow = (window.parent as IWindowContainer).findChildByName("ctlg_header_text") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.text = page.viewer.catalog.localization.getKey("recycler.alert.timeout");
         }
      }
      
      public function displayProcessingView() : void
      {
         var _loc1_:XML = this.getAssetXML("recyclerWidgetInactive");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         this.renderSlotGraphics();
         var _loc2_:ITextWindow = (window.parent as IWindowContainer).findChildByName("ctlg_header_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = "";
         }
      }
      
      public function displayFinishedView() : void
      {
         var _loc1_:XML = this.getAssetXML("recyclerWidgetInactive");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         this.renderSlotGraphics();
         var _loc2_:ITextWindow = (window.parent as IWindowContainer).findChildByName("ctlg_header_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = page.viewer.catalog.localization.getKey("recycler.info.finished");
         }
      }
      
      public function displayNormalView() : void
      {
         var _loc1_:XML = this.getAssetXML("recyclerWidget");
         if(_loc1_ == null)
         {
            return;
         }
         window.removeChildAt(0);
         window.addChild(page.viewer.catalog.windowManager.buildFromXML(_loc1_));
         this.renderSlotGraphics();
         window.procedure = this.onMainContainerEvent;
         window.parent.procedure = this.onMainContainerEvent;
         var _loc2_:ITextWindow = (window.parent as IWindowContainer).findChildByName("ctlg_header_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = page.viewer.catalog.localization.getKey("recycler.info.ready");
         }
      }
      
      private function renderSlotGraphics() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:BitmapData = this.getAssetBitmapData("ctlg_recycler_slot_bg");
         if(_loc1_ == null)
         {
            return;
         }
         _loc2_ = 1;
         while(_loc2_ <= RecyclerLogic.const_208)
         {
            _loc3_ = window.findChildByName("slot_bg_" + _loc2_) as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = _loc1_.clone();
               _loc3_.procedure = this.onSlotMouseEvent;
            }
            _loc2_++;
         }
         _loc2_ = 1;
         while(_loc2_ <= RecyclerLogic.const_208)
         {
            _loc3_ = window.findChildByName("slot_img_" + _loc2_) as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               _loc3_.bitmap = _loc1_.clone();
               _loc3_.procedure = this.onSlotMouseEvent;
            }
            _loc2_++;
         }
      }
      
      public function updateSlots() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(window == null || this.recycler == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < RecyclerLogic.const_208)
         {
            _loc2_ = window.findChildByName("slot_img_" + (_loc1_ + 1)) as IBitmapWrapperWindow;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = this.recycler.getSlotContent(_loc1_);
            if(_loc3_ == null)
            {
               _loc2_.bitmap = new BitmapData(1,1,true,16777215);
            }
            else
            {
               _loc4_ = this.getFurniImageResult(_loc3_);
               if(_loc4_ != null && _loc4_.data != null)
               {
                  _loc5_ = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
                  _loc5_.fillRect(_loc5_.rect,16777215);
                  _loc6_ = new Point((_loc2_.width - _loc4_.data.width) / 2,(_loc2_.height - _loc4_.data.height) / 2);
                  _loc5_.copyPixels(_loc4_.data,_loc4_.data.rect,_loc6_,null,null,true);
                  _loc2_.bitmap = _loc5_;
               }
            }
            _loc1_++;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      private function getFurniImageResult(param1:FurniSlotItem) : ImageResult
      {
         if(param1 == null || page.viewer.roomEngine == null)
         {
            return null;
         }
         if(param1.category == RoomObjectCategoryEnum.const_27)
         {
            return page.viewer.roomEngine.getFurnitureIcon(param1.typeId,this);
         }
         if(param1.category == RoomObjectCategoryEnum.const_26)
         {
            return page.viewer.roomEngine.getWallItemIcon(param1.typeId,this,param1.xxxExtra);
         }
         return null;
      }
      
      private function onMainContainerEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:IRoomEngine = page.viewer.roomEngine;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:ISelectedRoomObjectData = _loc3_.getSelectedObjectData(_loc3_.activeRoomId,_loc3_.activeRoomCategory);
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
            case WindowMouseEvent.const_25:
               if(this.var_323 != null)
               {
                  this.var_323.onMainContainerEvent(param1,param2,_loc4_);
               }
               break;
            case WindowMouseEvent.const_223:
               if(this.var_323 != null)
               {
                  this.var_323.onMainContainerEvent(param1,param2,_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(this.var_323 == null)
               {
                  this.var_323 = new CatalogObjectMover();
                  this.var_323.mainContainer = window;
                  this.var_323.roomEngine = _loc3_;
               }
               this.var_323.onMainContainerEvent(param1,param2,_loc4_);
         }
      }
      
      private function onSlotMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var slotId:int = 0;
         var event:WindowEvent = param1;
         var target:IWindow = param2;
         var roomEngine:IRoomEngine = page.viewer.roomEngine;
         if(roomEngine == null || this.recycler == null)
         {
            return;
         }
         var objectData:ISelectedRoomObjectData = roomEngine.getSelectedObjectData(roomEngine.activeRoomId,roomEngine.activeRoomCategory);
         if(event.type == WindowMouseEvent.const_52)
         {
            if(event.window.name.indexOf("slot_") == 0)
            {
               slotId = int(event.window.name.charAt(event.window.name.length - 1)) - 1;
               if(objectData != null)
               {
                  if(objectData.operation != RoomObjectOperationEnum.OBJECT_PLACE)
                  {
                     page.viewer.catalog.windowManager.alert("${generic.alert.title}","${catalog.alert.recycler.inventory}",0,function(param1:IAlertDialog, param2:WindowEvent):void
                     {
                        param1.dispose();
                     });
                     return;
                  }
                  this.recycler.placeObjectAtSlot(slotId,objectData.id,objectData.category,objectData.typeId,objectData.instanceData);
               }
               else
               {
                  this.recycler.releaseSlot(slotId);
               }
               roomEngine.cancelRoomObjectInsert();
            }
         }
         this.onMainContainerEvent(event,target);
      }
      
      public function updateRecycleButton(param1:Boolean) : void
      {
         if(disposed || window == null)
         {
            return;
         }
         var _loc2_:IWindow = window.findChildByName("recycler_recycle");
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
               _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRecycleButtonClick);
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      private function onRecycleButtonClick(param1:WindowMouseEvent) : void
      {
         if(this.recycler != null)
         {
            this.recycler.executeRecycler();
         }
      }
      
      private function getAssetXML(param1:String) : XML
      {
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as XML;
      }
      
      private function getAssetBitmapData(param1:String) : BitmapData
      {
         var _loc2_:BitmapDataAsset = page.viewer.catalog.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.content as BitmapData;
      }
   }
}
