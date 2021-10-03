package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TraxSequencer implements IHabboSound, IDisposable
   {
      
      private static const const_119:Number = 44100;
      
      private static const const_193:uint = 8192;
      
      private static const const_1348:uint = 88000;
      
      private static const const_1347:uint = 88000;
      
      private static const const_302:Vector.<int> = new Vector.<int>(const_193,true);
       
      
      private var _disposed:Boolean = false;
      
      private var _events:IEventDispatcher;
      
      private var var_515:Number;
      
      private var var_892:Sound;
      
      private var var_412:SoundChannel;
      
      private var var_1109:TraxData;
      
      private var var_1669:Map;
      
      private var var_1100:Boolean;
      
      private var var_1671:int;
      
      private var var_1378:int = 0;
      
      private var var_194:uint;
      
      private var var_413:Array;
      
      private var var_1668:Boolean;
      
      private var var_589:Boolean = true;
      
      private var var_341:uint;
      
      private var var_1377:uint;
      
      private var var_894:Boolean;
      
      private var var_720:Boolean;
      
      private var var_721:int;
      
      private var var_415:int;
      
      private var var_893:int;
      
      private var var_493:int;
      
      private var var_588:Timer;
      
      private var var_414:Timer;
      
      private var var_1110:int = 0;
      
      private var var_1670:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1377 = uint(30);
         super();
         this._events = param4;
         this.var_1671 = param1;
         this.var_515 = 1;
         this.var_892 = new Sound();
         this.var_412 = null;
         this.var_1669 = param3;
         this.var_1109 = param2;
         this.var_1100 = true;
         this.var_194 = 0;
         this.var_413 = [];
         this.var_1668 = false;
         this.var_341 = 0;
         this.var_589 = false;
         this.var_894 = false;
         this.var_720 = false;
         this.var_721 = 0;
         this.var_415 = 0;
         this.var_893 = 0;
         this.var_493 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_194 = uint(param1 * const_119);
      }
      
      public function get volume() : Number
      {
         return this.var_515;
      }
      
      public function get position() : Number
      {
         return this.var_194 / const_119;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1100;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1100 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_589;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_415 / const_119;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_415 = int(param1 * const_119);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_721 / const_119;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_721 = int(param1 * const_119);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_1109;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_515 = param1;
         if(this.var_412 != null)
         {
            this.var_412.soundTransform = new SoundTransform(this.var_515);
         }
      }
      
      public function get length() : Number
      {
         return this.var_341 / const_119;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopImmediately();
            this.var_1109 = null;
            this.var_1669 = null;
            this.var_413 = null;
            this._events = null;
            this.var_892 = null;
            this._disposed = true;
         }
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1100)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1668)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this.var_413 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1109.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_1109.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc4_.itemCount)
            {
               _loc8_ = _loc4_.getItem(_loc7_).id;
               _loc9_ = this.var_1669.getValue(_loc8_) as TraxSample;
               _loc9_.setUsageFromSong(this.var_1671,_loc1_);
               if(_loc9_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc10_ = this.getSampleBars(_loc9_.length);
               _loc11_ = _loc4_.getItem(_loc7_).length / _loc10_;
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  if(_loc8_ != 0)
                  {
                     _loc3_.add(_loc5_,_loc9_);
                  }
                  _loc6_ += _loc10_;
                  _loc5_ = uint(_loc6_ * const_1347);
                  _loc12_++;
               }
               if(this.var_341 < _loc5_)
               {
                  this.var_341 = _loc5_;
               }
               _loc7_++;
               return false;
            }
            this.var_413.push(_loc3_);
            _loc2_++;
         }
         this.var_1668 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_412 != null)
         {
            this.stopImmediately();
         }
         if(this.var_721 > 0)
         {
            this.var_894 = true;
            this.var_893 = 0;
         }
         this.var_720 = false;
         this.var_493 = 0;
         this.var_589 = false;
         this.var_892.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1378 = param1 * const_119;
         this.var_1110 = 0;
         this.var_1670 = 0;
         this.var_412 = this.var_892.play();
         this.volume = this.var_515;
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_589)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_415 > 0 && !this.var_589)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_412 != null)
         {
            this.var_412.stop();
            this.var_412 = null;
         }
         if(this.var_892 != null)
         {
            this.var_892.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_588 == null)
         {
            this.var_720 = true;
            this.var_493 = 0;
            this.var_588 = new Timer(this.var_1377 + this.var_415 / (const_119 / 1000),1);
            this.var_588.start();
            this.var_588.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1348);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         if(this.var_413 != null)
         {
            _loc2_ = this.var_413.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_413[_loc3_];
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_194)
               {
                  _loc5_++;
               }
               _loc1_.push(_loc5_ - 1);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_413 == null)
         {
            return;
         }
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_413.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_413[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_194 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_193;
            if(this.var_341 - this.var_194 < _loc8_)
            {
               _loc8_ = this.var_341 - this.var_194;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_194 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_194;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_302,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_302[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_302,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_341 < this.var_1378 ? int(this.var_341) : (this.var_1378 > 0 ? int(this.var_1378) : int(this.var_341));
         if(this.var_194 > _loc1_ + this.var_1377 * (const_119 / 1000) && !this.var_589)
         {
            this.var_589 = true;
            if(this.var_414 != null)
            {
               this.var_414.reset();
               this.var_414.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_414 = new Timer(2,1);
            this.var_414.start();
            this.var_414.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_194 > _loc1_ - this.var_415 && !this.var_720)
         {
            this.var_894 = false;
            this.var_720 = true;
            this.var_493 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1110)
         {
            ++this.var_1670;
            Logger.log("Audio buffer under run...");
            this.var_1110 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_193;
         if(this.var_341 - this.var_194 < _loc2_)
         {
            _loc2_ = this.var_341 - this.var_194;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_194 += const_193;
         this.var_1110 += const_193;
         if(this.var_412 != null)
         {
            this.var_1377 = param1.position / const_119 * 1000 - this.var_412.position;
         }
         this.checkSongFinishing();
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_894 && !this.var_720)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_894)
               {
                  _loc5_ = 1 / this.var_721;
                  _loc6_ = this.var_893 / Number(this.var_721);
                  this.var_893 += const_193;
                  if(this.var_893 > this.var_721)
                  {
                     this.var_894 = false;
                  }
               }
               else if(this.var_720)
               {
                  _loc5_ = -1 / this.var_415;
                  _loc6_ = 1 - this.var_493 / Number(this.var_415);
                  this.var_493 += const_193;
                  if(this.var_493 > this.var_415)
                  {
                     this.var_493 = this.var_415;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_193)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(Number(const_302[_loc4_]) * 0);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(Number(const_302[_loc6_]) * 0 * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(Number(const_302[_loc6_]) * 0);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_589)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1671));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_588 != null)
         {
            this.var_588.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_588.reset();
            this.var_588 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_414 != null)
         {
            this.var_414.reset();
            this.var_414.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_414 = null;
         }
      }
   }
}
