package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2115:int = 0;
      
      public static const const_1753:int = 1;
      
      public static const const_1582:int = 2;
      
      public static const const_2106:int = 3;
      
      public static const const_2094:int = 4;
      
      public static const const_2014:int = 5;
      
      public static const const_1721:int = 10;
      
      public static const const_2049:int = 11;
      
      public static const const_1961:int = 12;
      
      public static const const_1986:int = 13;
      
      public static const const_2147:int = 16;
      
      public static const const_1954:int = 17;
      
      public static const const_2038:int = 18;
      
      public static const const_2084:int = 19;
      
      public static const const_1981:int = 20;
      
      public static const const_2114:int = 22;
      
      public static const const_2041:int = 23;
      
      public static const const_1956:int = 24;
      
      public static const const_2021:int = 25;
      
      public static const const_2016:int = 26;
      
      public static const const_2020:int = 27;
      
      public static const const_2135:int = 28;
      
      public static const const_2071:int = 29;
      
      public static const const_1980:int = 100;
      
      public static const const_2012:int = 101;
      
      public static const const_2039:int = 102;
      
      public static const const_2022:int = 103;
      
      public static const const_2083:int = 104;
      
      public static const const_2124:int = 105;
      
      public static const const_1975:int = 106;
      
      public static const const_1949:int = 107;
      
      public static const const_2103:int = 108;
      
      public static const const_2000:int = 109;
      
      public static const const_2134:int = 110;
      
      public static const const_1968:int = 111;
      
      public static const const_2059:int = 112;
      
      public static const const_2047:int = 113;
      
      public static const const_2112:int = 114;
      
      public static const const_2062:int = 115;
      
      public static const const_1985:int = 116;
      
      public static const const_2051:int = 117;
      
      public static const const_1958:int = 118;
      
      public static const const_2027:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1753:
            case const_1721:
               return "banned";
            case const_1582:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
