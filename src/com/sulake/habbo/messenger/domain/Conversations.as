package com.sulake.habbo.messenger.domain
{
   import com.sulake.habbo.messenger.Util;
   
   public class Conversations
   {
      
      private static var var_1226:int = 1;
       
      
      private var var_446:IConversationsDeps;
      
      private var var_138:Array;
      
      private var _closedConversations:Array;
      
      private var _startIndex:int;
      
      public function Conversations(param1:IConversationsDeps)
      {
         this.var_138 = new Array();
         this._closedConversations = new Array();
         super();
         this.var_446 = param1;
      }
      
      public function changeStartIndex(param1:int) : void
      {
         this._startIndex += param1;
      }
      
      public function setSelected(param1:Conversation) : void
      {
         this.clearSelections();
         param1.setSelected(true);
         var _loc2_:int = this.var_138.indexOf(param1);
         while(this._startIndex + this.var_446.getTabCount() <= _loc2_)
         {
            ++this._startIndex;
         }
      }
      
      public function closeConversation() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Conversation = this.findSelectedConversation();
         if(_loc1_ != null)
         {
            _loc2_ = this.var_138.indexOf(_loc1_);
            Util.remove(this.var_138,_loc1_);
            this._closedConversations.push(_loc1_);
            _loc1_.setSelected(false);
            while(_loc2_ >= 0)
            {
               if(this.var_138[_loc2_] != null)
               {
                  this.var_138[_loc2_].setSelected(true);
                  break;
               }
               _loc2_--;
            }
         }
         this.fixStartIndex();
      }
      
      public function addTestUser() : void
      {
         this.addConversation(var_1226++);
      }
      
      public function addConversation(param1:int) : Conversation
      {
         var _loc2_:Boolean = this._closedConversations.length == 0 && this.var_138.length == 0;
         var _loc3_:Conversation = this.addConversationInt(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         if(this.var_138.length == 1)
         {
            this.var_138[0].setSelected(true);
         }
         if(_loc2_)
         {
            _loc3_.addMessage(new Message(Message.const_818,0,this.var_446.getText("messenger.moderationinfo"),""));
         }
         return _loc3_;
      }
      
      public function findConversation(param1:int) : Conversation
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_138)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function addMessageAndUpdateView(param1:Message) : void
      {
         var _loc2_:int = this.var_138.length;
         var _loc3_:Conversation = this.addConversation(param1.senderId);
         if(_loc3_ == null)
         {
            Logger.log("Received message from non friend " + param1.senderId + ". Ignoring");
            return;
         }
         var _loc4_:Boolean = _loc3_.newMessageArrived;
         _loc3_.setNewMessageArrived(true);
         _loc3_.addMessage(param1);
         this.var_446.addMsgToView(_loc3_,param1);
         if(_loc2_ != this.var_138.length || _loc4_ != _loc3_.newMessageArrived)
         {
            this.var_446.refresh(false);
         }
      }
      
      public function setOnlineStatusAndUpdateView(param1:int, param2:Boolean) : void
      {
         var _loc3_:Conversation = this.findConversation(param1);
         if(_loc3_ == null)
         {
            _loc3_ = this.findClosedConversation(param1);
         }
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Message = this.getOnlineInfoMsg(param2);
         _loc3_.addMessage(_loc4_);
         this.var_446.addMsgToView(_loc3_,_loc4_);
      }
      
      public function setFollowingAllowedAndUpdateView(param1:int, param2:Boolean) : void
      {
         var _loc3_:Conversation = this.findConversation(param1);
         if(_loc3_ == null)
         {
            _loc3_ = this.findClosedConversation(param1);
         }
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.followingAllowed = param2;
         if(_loc3_.selected)
         {
            this.var_446.refresh(false);
         }
      }
      
      public function findSelectedConversation() : Conversation
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_138)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get openConversations() : Array
      {
         return this.var_138;
      }
      
      public function get method_3() : int
      {
         return this._startIndex;
      }
      
      private function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_138)
         {
            _loc1_.setSelected(false);
         }
      }
      
      private function findClosedConversation(param1:int) : Conversation
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._closedConversations)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function addConversationInt(param1:int) : Conversation
      {
         var _loc2_:Conversation = this.findConversation(param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         _loc2_ = this.findClosedConversation(param1);
         if(_loc2_ != null)
         {
            Util.remove(this._closedConversations,_loc2_);
            this.var_138.push(_loc2_);
            return _loc2_;
         }
         _loc2_ = this.var_446.createConversation(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         this.var_138.push(_loc2_);
         return _loc2_;
      }
      
      private function fixStartIndex() : void
      {
         this._startIndex = Math.min(this._startIndex,this.var_138.length - this.var_446.getTabCount());
         this._startIndex = Math.max(0,this._startIndex);
      }
      
      private function getOnlineInfoMsg(param1:Boolean) : Message
      {
         return new Message(Message.const_938,0,this.getOnlineText(param1),Util.getFormattedNow());
      }
      
      private function getOnlineText(param1:Boolean) : String
      {
         return this.var_446.getText(!!param1 ? "messenger.notification.online" : "messenger.notification.offline");
      }
   }
}
