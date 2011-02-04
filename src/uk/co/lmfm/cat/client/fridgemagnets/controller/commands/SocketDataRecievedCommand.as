/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.commands.SocketDataRecievedCommand
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.controller.commands
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.AddMagnetSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.model.MagnetsProxy;
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author soulwire
	 */
	public class SocketDataRecievedCommand extends SignalCommand
	{
		[Inject]
		public var proxy : MagnetsProxy;
		
		[Inject]
		public var data: Vector.<MagnetVO>;
		
		[Inject]
		public var addMagnetSignal : AddMagnetSignal;
		
		override public function execute() : void
		{
			var magnet : MagnetVO;
			
			for (var i : int = 0; i < data.length; i++)
			{
				magnet = data[i];
				
				if (!proxy.hasMagnet(magnet))
				{
					addMagnetSignal.dispatch(magnet);
				}
			}
		}

	}
}
