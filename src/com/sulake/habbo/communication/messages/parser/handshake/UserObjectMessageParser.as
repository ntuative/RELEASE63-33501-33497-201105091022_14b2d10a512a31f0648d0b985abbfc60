package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_614:String;
      
      private var var_908:String;
      
      private var var_2686:String;
      
      private var var_1743:String;
      
      private var var_2688:int;
      
      private var var_2685:String;
      
      private var var_2689:int;
      
      private var var_2683:int;
      
      private var var_2684:int;
      
      private var _respectLeft:int;
      
      private var var_858:int;
      
      private var var_2687:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_614 = param1.readString();
         this.var_908 = param1.readString();
         this.var_2686 = param1.readString();
         this.var_1743 = param1.readString();
         this.var_2688 = param1.readInteger();
         this.var_2685 = param1.readString();
         this.var_2689 = param1.readInteger();
         this.var_2683 = param1.readInteger();
         this.var_2684 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_858 = param1.readInteger();
         this.var_2687 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_614;
      }
      
      public function get sex() : String
      {
         return this.var_908;
      }
      
      public function get customData() : String
      {
         return this.var_2686;
      }
      
      public function get realName() : String
      {
         return this.var_1743;
      }
      
      public function get tickets() : int
      {
         return this.var_2688;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2685;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2689;
      }
      
      public function get directMail() : int
      {
         return this.var_2683;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2684;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_858;
      }
      
      public function get identityId() : int
      {
         return this.var_2687;
      }
   }
}
