/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.model.MagnetsProxy
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.model
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.SocketDataRecievedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;

	import org.robotlegs.mvcs.Actor;

	import flash.utils.Dictionary;

	/**
	 * @author soulwire
	 */
	public class MagnetsProxy extends Actor
	{
		[Inject]
		public var socketDataRecieved : SocketDataRecievedSignal;
		
		private var _magnets : Vector.<MagnetVO> = new Vector.<MagnetVO>();
		private var _magnetsByID : Dictionary = new Dictionary();
		
		public function MagnetsProxy()
		{
			trace(this);
			super();
		}
		
		public function hasMagnet(magnet : MagnetVO) : Boolean
		{
			return _magnetsByID[magnet.id] != null;
		}
		
		public function addMagnet(magnet : MagnetVO) : void
		{
			_magnets.push(magnet);
			_magnetsByID[magnet.id] = magnet;
		}
	}
}
