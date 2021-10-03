package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.SoundSettingsEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.SetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.parser.sound.SoundSettingsParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.music.HabboMusicController;
   import com.sulake.habbo.sound.object.HabboSound;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSample;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager, IUpdateReceiver
   {
      
      private static const const_1418:int = 60;
      
      private static const const_1420:int = 25165823;
      
      private static const const_1419:int = 16777215;
       
      
      private var var_191:IHabboConfigurationManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _connection:IConnection;
      
      private var _roomEngine:IRoomEngine;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_942:IHabboNotifications;
      
      private var var_515:Number = 1.0;
      
      private var var_621:Map;
      
      private var var_1182:Array;
      
      private var var_251:Map;
      
      private var var_941:Map;
      
      private var var_769:int = -1;
      
      private var var_768:TraxSequencer;
      
      private var var_228:IHabboMusicController;
      
      private var var_1181:Map;
      
      private var var_1452:ByteArray;
      
      private var var_2392:Boolean = false;
      
      public function HabboSoundManagerFlash10(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null, param4:Boolean = true)
      {
         this.var_621 = new Map();
         this.var_1182 = [];
         this.var_251 = new Map();
         this.var_941 = new Map();
         this.var_1181 = new Map();
         this.var_1452 = new ByteArray();
         super(param1,param2,param3);
         if(param4)
         {
            queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
            queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
            queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
            queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
            queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         }
         events.addEventListener(TraxSongLoadEvent.const_928,this.onTraxLoadComplete);
         registerUpdateReceiver(this,1);
         Logger.log("Sound manager 10 init");
      }
      
      public function get musicController() : IHabboMusicController
      {
         return this.var_228;
      }
      
      public function get volume() : Number
      {
         return this.var_515;
      }
      
      public function set volume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
         this.storeVolumeSetting();
      }
      
      public function set previewVolume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
      }
      
      override public function dispose() : void
      {
         this._connection = null;
         if(this.var_228)
         {
            this.var_228.dispose();
            this.var_228 = null;
         }
         if(this.var_251)
         {
            this.var_251.dispose();
            this.var_251 = null;
         }
         if(this.var_941)
         {
            this.var_941.dispose();
            this.var_941 = null;
         }
         if(this.var_621)
         {
            this.var_621.dispose();
            this.var_621 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_191)
         {
            this.var_191.release(new IIDHabboConfigurationManager());
            this.var_191 = null;
         }
         if(this._roomEngine)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_942)
         {
            this.var_942.release(new IIDHabboNotifications());
            this.var_942 = null;
         }
         super.dispose();
      }
      
      public function playSound(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:HabboSound = this.var_941.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "";
            switch(param1)
            {
               case HabboSoundTypesEnum.const_1189:
                  _loc3_ = "sound_call_for_help";
                  break;
               case HabboSoundTypesEnum.const_1733:
                  _loc3_ = "sound_guide_received_invitation";
                  break;
               case HabboSoundTypesEnum.const_1239:
                  _loc3_ = "sound_console_new_message";
                  break;
               case HabboSoundTypesEnum.const_1205:
                  _loc3_ = "sound_console_message_sent";
                  break;
               case HabboSoundTypesEnum.const_1276:
                  _loc3_ = "sound_catalogue_pixels";
                  break;
               case HabboSoundTypesEnum.const_1264:
                  _loc3_ = "sound_catalogue_cash";
                  break;
               case HabboSoundTypesEnum.const_1848:
                  _loc3_ = "sound_respect_received";
                  break;
               default:
                  Logger.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
            }
            _loc4_ = assets.getAssetByName(_loc3_);
            _loc5_ = _loc4_.content as Sound;
            if(_loc5_ == null)
            {
               return;
            }
            _loc2_ = new HabboSound(_loc5_);
            this.var_941.add(param1,_loc2_);
         }
         _loc2_.volume = this.var_515;
         _loc2_.play();
      }
      
      public function loadSoundUrl(param1:String) : IHabboSound
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         var _loc3_:Sound = new Sound();
         _loc3_.load(_loc2_);
         var _loc4_:HabboSound = new HabboSound(_loc3_);
         _loc4_.volume = this.var_515;
         return _loc4_ as IHabboSound;
      }
      
      private function loadSample(param1:int) : void
      {
         if(this.var_191 == null)
         {
            return;
         }
         var _loc2_:String = this.var_191.getKey("flash.dynamic.download.url","furniture/");
         _loc2_ += this.var_191.getKey("flash.dynamic.download.samples.template","mp3/sound_machine_sample_%typeid%.mp3");
         _loc2_ = _loc2_.replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener(Event.COMPLETE,this.onSampleLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         _loc4_.load(_loc3_);
         this.var_621.add(_loc4_,param1);
      }
      
      public function loadTraxSong(param1:int, param2:String) : IHabboSound
      {
         if(this.var_768 != null)
         {
            return this.addTraxSongForDownload(param1,param2);
         }
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2);
         if(!_loc3_.ready)
         {
            this.var_768 = _loc3_;
            this.var_769 = param1;
         }
         return _loc3_ as IHabboSound;
      }
      
      private function addTraxSongForDownload(param1:int, param2:String) : IHabboSound
      {
         var _loc3_:TraxSequencer = this.createTraxInstance(param1,param2,false);
         if(!_loc3_.ready)
         {
            this.var_1181.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      private function createTraxInstance(param1:int, param2:String, param3:Boolean = true) : TraxSequencer
      {
         var _loc4_:TraxData = new TraxData(param2);
         var _loc5_:TraxSequencer = new TraxSequencer(param1,_loc4_,this.var_251,events);
         _loc5_.volume = this.var_515;
         this.validateSampleAvailability(_loc5_,param3);
         return _loc5_;
      }
      
      public function validateSampleAvailability(param1:TraxSequencer, param2:Boolean) : void
      {
         var _loc3_:TraxData = param1.traxData;
         var _loc4_:Array = _loc3_.getSampleIds();
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length)
         {
            if(this.var_251.getValue(int(_loc4_[_loc6_])) == null)
            {
               if(param2)
               {
                  this.loadSample(int(_loc4_[_loc6_]));
               }
               _loc5_ = true;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            param1.ready = false;
         }
         else
         {
            param1.ready = true;
         }
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(this.var_942 == null)
         {
            return;
         }
         this.var_942.addSongPlayingNotification(param1,param2);
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this.var_191 = param2 as IHabboConfigurationManager;
            if(this.var_191.getBoolean("trax.player.sample.memory.purge.enabled",false))
            {
               this.var_2392 = true;
            }
         }
      }
      
      protected function setHabboConfiguration(param1:IHabboConfigurationManager) : void
      {
         this.var_191 = param1;
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._communication = IHabboCommunicationManager(param2);
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(this.onConnectionReady);
         if(_loc2_ != null)
         {
            _loc2_.addMessageEvent(new SoundSettingsEvent(this.onSoundSettingsEvent));
            _loc2_.send(new GetSoundSettingsComposer());
            this.onConnectionReady(_loc2_);
            this.initMusicController();
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._roomEngine = IRoomEngine(param2);
         this.initMusicController();
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._toolbar = IHabboToolbar(param2);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_73,this.onHabboToolbarEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_35,this.onHabboToolbarEvent);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_942 = IHabboNotifications(param2);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
         this.initMusicController();
      }
      
      private function initMusicController() : void
      {
         if(this.var_191 == null || this._connection == null || this._roomEngine == null || this.var_228 != null)
         {
            return;
         }
         this.var_228 = new HabboMusicController(this,events,this._roomEngine.events,this._connection);
      }
      
      protected function setMusicController(param1:IHabboMusicController) : void
      {
         this.var_228 = param1;
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         var _loc2_:Sound = param1.target as Sound;
         this.var_1182.push(_loc2_);
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_228 == null)
         {
            return;
         }
         this.var_228.onSongLoaded(_loc2_.id);
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
         events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1859,this.var_769));
         this.var_769 = -1;
         this.var_768 = null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_73)
         {
            this.setHabboToolbarIconState(this.var_515 > 0);
            return;
         }
         if(param1.type == HabboToolbarEvent.const_35)
         {
            if(param1.iconId == HabboToolbarIconEnum.SOUNDS)
            {
               if(this.var_515 == 1)
               {
                  this.updateVolumeSetting(0);
               }
               else
               {
                  this.updateVolumeSetting(1);
               }
               this.storeVolumeSetting();
            }
         }
      }
      
      private function storeVolumeSetting() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new SetSoundSettingsComposer(int(this.var_515 * 100)));
         }
      }
      
      private function updateVolumeSetting(param1:Number) : void
      {
         this.var_515 = param1;
         this.var_228.updateVolume(this.var_515);
         this.setHabboToolbarIconState(param1 > 0);
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc2_:SoundSettingsEvent = param1 as SoundSettingsEvent;
         var _loc3_:SoundSettingsParser = _loc2_.getParser() as SoundSettingsParser;
         if(_loc3_.volume == 1 || _loc3_.volume == 0)
         {
            this.updateVolumeSetting(_loc3_.volume * 1);
         }
         else
         {
            this.updateVolumeSetting(_loc3_.volume / 100);
         }
      }
      
      private function setHabboToolbarIconState(param1:Boolean) : void
      {
         if(this._toolbar == null)
         {
            return;
         }
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_101,HabboToolbarIconEnum.SOUNDS);
         _loc2_.iconState = !!param1 ? "1" : "0";
         this._toolbar.events.dispatchEvent(_loc2_);
      }
      
      private function processLoadedSample(param1:Sound) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(this.var_621.getValue(param1) != null)
         {
            _loc2_ = this.var_621.remove(param1);
            if(this.var_251.getValue(_loc2_) == null)
            {
               this.var_1452.clear();
               _loc3_ = param1.length;
               param1.extract(this.var_1452,int(_loc3_ * 44.1));
               _loc4_ = new TraxSample(this.var_1452,_loc2_,TraxSample.const_1580,TraxSample.const_1821);
               this.var_251.add(_loc2_,_loc4_);
            }
         }
      }
      
      private function processLoadedSamples() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_1182.length > 0)
         {
            _loc1_ = getTimer();
            _loc2_ = _loc1_;
            while(_loc2_ - _loc1_ < const_1418 && this.var_1182.length > 0)
            {
               _loc3_ = this.var_1182.splice(0,1)[0];
               this.processLoadedSample(_loc3_);
               _loc2_ = getTimer();
            }
            if(this.var_621.length == 0 && this.var_769 != -1)
            {
               this.var_768.ready = true;
               _loc4_ = this.var_769;
               this.var_769 = -1;
               this.var_768 = null;
               events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_928,_loc4_));
               if(this.var_2392)
               {
                  this.processSampleMemoryUsage();
               }
            }
         }
      }
      
      private function loadNextSong() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_768 == null && this.var_1181.length > 0)
         {
            _loc1_ = this.var_1181.getKey(0);
            _loc2_ = this.var_1181.remove(_loc1_);
            if(_loc2_ != null)
            {
               this.validateSampleAvailability(_loc2_,true);
               if(_loc2_.ready)
               {
                  events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_928,_loc1_));
               }
               else
               {
                  this.var_768 = _loc2_;
                  this.var_769 = _loc1_;
               }
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         this.processLoadedSamples();
         this.loadNextSong();
      }
      
      private function logSampleUsage() : void
      {
      }
      
      private function processSampleMemoryUsage() : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc1_:* = 0;
         var _loc2_:* = [];
         var _loc3_:Array = this.var_228.samplesIdsInUse;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_251.length)
         {
            _loc5_ = this.var_251.getKey(_loc4_);
            _loc6_ = this.var_251.getWithIndex(_loc4_);
            if(_loc6_.usageCount != 0 && _loc3_.indexOf(_loc5_) == -1)
            {
               _loc2_.push(_loc6_);
            }
            _loc1_ += _loc6_.length;
            _loc4_++;
         }
         if(_loc1_ > const_1420)
         {
            _loc7_ = [];
            Logger.log("Sample memory limit reached, clearing the oldest and least frequently used samples");
            _loc2_.sort(this.orderUsageAndTimeStamp);
            _loc8_ = 0;
            _loc9_ = 0;
            while(_loc8_ < _loc1_ - const_1419 && _loc9_ < _loc2_.length)
            {
               _loc10_ = _loc2_[_loc9_++];
               _loc8_ += _loc10_.length;
               _loc7_.push(_loc10_.id);
            }
            _loc2_ = null;
            if(_loc7_.length > 0)
            {
               for each(_loc11_ in _loc7_)
               {
                  Logger.log("Purging sample : " + _loc11_);
                  _loc12_ = this.var_251.getValue(_loc11_) as TraxSample;
                  _loc12_.dispose();
                  this.var_251.remove(_loc11_);
               }
               this.var_228.samplesUnloaded(_loc7_);
            }
         }
      }
      
      private function orderUsageAndTimeStamp(param1:TraxSample, param2:TraxSample) : int
      {
         if(param1.usageCount < param2.usageCount)
         {
            return -1;
         }
         if(param1.usageCount > param2.usageCount)
         {
            return 1;
         }
         if(param1.usageTimeStamp < param2.usageTimeStamp)
         {
            return -1;
         }
         if(param1.usageTimeStamp > param2.usageTimeStamp)
         {
            return 1;
         }
         return 0;
      }
   }
}
