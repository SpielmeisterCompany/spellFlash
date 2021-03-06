package Spielmeister.Spell.Platform.Private.Loader {

	import Spielmeister.Spell.Platform.Private.Sound.AudioContext

	import flash.media.Sound


	public class SoundLoader implements Loader {
		private var asset : Object
		private var audioContext : AudioContext
		private var url : String
		private var onLoadCallback : Function
		private var onErrorCallback : Function

		public function SoundLoader( audioContext : AudioContext, asset : Object, url : String, onLoadCallback : Function, onErrorCallback : Function, onTimedOutCallback : Function ) {
			this.asset           = asset
			this.audioContext    = audioContext
			this.url             = url
			this.onLoadCallback  = onLoadCallback
			this.onErrorCallback = onErrorCallback
		}

		public function start() : void {
			var audioContext : AudioContext = this.audioContext,
				onLoadCallback : Function   = this.onLoadCallback

			var onLoad : Function = function( sound : Sound ) : void {
				onLoadCallback(
					audioContext.createSound( sound )
				)
			}

			this.audioContext.loadBuffer( url, this.asset, onLoad )
		}
	}
}
