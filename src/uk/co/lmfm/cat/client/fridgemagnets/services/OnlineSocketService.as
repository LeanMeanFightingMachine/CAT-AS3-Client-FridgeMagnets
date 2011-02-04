
/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.services.OnlineSocketService
 *	
 *	@version 1.00 | Feb 4, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.services
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.SocketDataRecievedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.enum.Config;
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import uk.co.lmfm.cat.client.fridgemagnets.services.util.ISocketDataParser;

	import org.robotlegs.mvcs.Actor;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;

	/**
	 * @author justin
	 */
	public class OnlineSocketService extends Actor implements ISocketService
	{
		[Inject]
		public var socketDataRecievedSignal : SocketDataRecievedSignal;
		
		[Inject]
		public var socketDataParser : ISocketDataParser;
		
		private var _socket : Socket = new Socket();
		
		public function connect() : void
		{
			trace(this, "connect()");
			
			_socket.addEventListener(Event.CONNECT, socketConnect);
			_socket.addEventListener(Event.CLOSE, socketClose);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, socketError);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, socketData);
			
			try
			{
				_socket.connect(Config.HOST, Config.PORT);
			}
			catch (e : Error)
			{
				trace("Error on connect: " + e);
			}
		}

		public function connected() : void
		{
			trace(this, "connected()");
		}

		public function sendData(data : Array) : void
		{
			var msg : String = socketDataParser.toSocketString(data) + "\n";
			
			try
			{
				_socket.writeUTFBytes(msg);
				_socket.flush();
				trace("Message sent: " + msg);
			}
			catch(e : Error)
			{
				trace("Error sending data: " + e);
			}
		}

		public function receiveData(data : String) : void
		{
			var test : Vector.<MagnetVO> = socketDataParser.fromSocketString(data);
			socketDataRecievedSignal.dispatch(test);
		}
		
		//	----------------------------------------------------------------
		//	EVENT HANDLERS
		//	----------------------------------------------------------------
		
		private function socketConnect(event : Event) : void
		{
			trace("Connected: " + event);
			connected();
		}

		private function socketData(event : ProgressEvent) : void
		{
			trace("Receiving data: " + event);
			receiveData(_socket.readUTFBytes(_socket.bytesAvailable));
		}

		private function socketClose(event : Event) : void
		{
			trace("Connection closed: " + event);
		}

		private function socketError(event : IOErrorEvent) : void
		{
			trace("Socket error: " + event);
		}

		private function securityError(event : SecurityErrorEvent) : void
		{
			trace("Security error: " + event);
		}
	}
}
