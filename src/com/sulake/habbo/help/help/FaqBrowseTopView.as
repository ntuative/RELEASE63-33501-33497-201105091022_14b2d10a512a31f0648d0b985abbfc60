package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.help.GetFaqCategoriesMessageComposer;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.data.FaqCategory;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class FaqBrowseTopView extends HelpViewController
   {
       
      
      public function FaqBrowseTopView(param1:HelpUI, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
      }
      
      override public function render() : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(container != null)
         {
            container.dispose();
         }
         var _loc1_:FaqIndex = main.getFaq();
         if(_loc1_ == null)
         {
            return;
         }
         container = buildXmlWindow("help_faq_categories") as IWindowContainer;
         if(container == null)
         {
            return;
         }
         if(_loc1_.getCategoryCount() == 0)
         {
            main.sendMessage(new GetFaqCategoriesMessageComposer());
            return;
         }
         var _loc2_:IItemListWindow = container.findChildByTag("content") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         var _loc3_:String = "";
         var _loc4_:Array = _loc1_.getCategoryTitleArray();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = "#" + _loc5_ + " .. " + _loc4_[_loc5_];
            _loc3_ = _loc3_ + _loc6_ + String.fromCharCode(13);
            _loc7_ = buildHelpCategoryListEntryItem(_loc6_,"help_itemlist_item",this.onListItemClick) as IWindow;
            if(_loc2_ != null && _loc7_ != null)
            {
               _loc7_.name = "list_entry";
               _loc2_.addListItem(_loc7_);
            }
            _loc5_++;
         }
         super.render();
      }
      
      private function onListItemClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         this.handleListItemClick(_loc2_);
      }
      
      private function handleListItemClick(param1:IWindow) : void
      {
         var _loc2_:IItemListWindow = container.findChildByTag("content") as IItemListWindow;
         if(_loc2_ == null || param1 == null || param1.parent == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.getListItemIndex(param1.parent);
         var _loc4_:FaqIndex = main.getFaq();
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:FaqCategory = _loc4_.getCategoryByIndex(_loc3_);
         if(_loc5_ == null)
         {
            return;
         }
         main.showUI(HabboHelpViewEnum.const_329);
         main.tellUI(HabboHelpViewEnum.const_329,_loc5_);
      }
   }
}
