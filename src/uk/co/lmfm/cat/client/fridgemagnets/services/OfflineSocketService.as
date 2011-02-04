/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.services.OfflineSocketService
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.services
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.SocketDataRecievedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import uk.co.lmfm.cat.client.fridgemagnets.services.util.ISocketDataParser;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author soulwire
	 */
	public class OfflineSocketService extends Actor implements ISocketService
	{
		[Inject]
		public var socketDataRecievedSignal : SocketDataRecievedSignal;
		
		[Inject]
		public var socketDataParser : ISocketDataParser;
		
		public function OfflineSocketService()
		{
			super();
		}

		public function connect() : void
		{
			trace("connect");
			connected();
		}
		
		public function connected() : void
		{
			var testData : String = '[{"id":0,"x":197,"y":110,"locked":false},{"id":1,"x":192,"y":150,"locked":false},{"id":2,"x":158,"y":67,"locked":false},{"id":3,"x":97,"y":90,"locked":true},{"id":4,"x":137,"y":121,"locked":false},{"id":5,"x":74,"y":73,"locked":false},{"id":6,"x":8,"y":5,"locked":false},{"id":7,"x":68,"y":80,"locked":false},{"id":8,"x":84,"y":97,"locked":false},{"id":9,"x":30,"y":63,"locked":false}]';
			receiveData(testData);
		}

		public function sendData(data : Array) : void
		{
			trace("sendData", data, socketDataParser.toSocketString(data));
		}

		public function receiveData(data : String) : void
		{
			var test : Vector.<MagnetVO> = socketDataParser.fromSocketString(data);
			socketDataRecievedSignal.dispatch(test);
		}
	}
}
