package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_963:BigInteger;
      
      private var var_2606:BigInteger;
      
      private var var_1911:BigInteger;
      
      private var var_2605:BigInteger;
      
      private var var_1511:BigInteger;
      
      private var var_1912:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1511 = param1;
         this.var_1912 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1511.toString() + ",generator: " + this.var_1912.toString() + ",secret: " + param1);
         this.var_963 = new BigInteger();
         this.var_963.fromRadix(param1,param2);
         this.var_2606 = this.var_1912.modPow(this.var_963,this.var_1511);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1911 = new BigInteger();
         this.var_1911.fromRadix(param1,param2);
         this.var_2605 = this.var_1911.modPow(this.var_963,this.var_1511);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2606.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2605.toRadix(param1);
      }
   }
}
