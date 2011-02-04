/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.commands.MagnetUpdatedCommand
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.controller.commands
{
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import uk.co.lmfm.cat.client.fridgemagnets.services.ISocketService;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author soulwire
	 */
	public class MagnetUpdatedCommand extends SignalCommand
	{
		[Inject]
		public var magnet : MagnetVO;
		
		[Inject]
		public var socketService : ISocketService;
		
		override public function execute() : void
		{
			// Send an Array not a Vector so JSON can decode
			socketService.sendData([magnet]);
		}

	}
}
