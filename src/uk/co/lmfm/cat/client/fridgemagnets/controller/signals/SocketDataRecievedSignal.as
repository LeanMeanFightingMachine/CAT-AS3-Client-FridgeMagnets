/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.signals.SocketDataRecievedSignal
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.controller.signals
{
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import org.osflash.signals.Signal;

	/**
	 * @author soulwire
	 */
	public class SocketDataRecievedSignal extends Signal
	{
		public function SocketDataRecievedSignal()
		{
			super(Vector.<MagnetVO>);
		}
	}
}
