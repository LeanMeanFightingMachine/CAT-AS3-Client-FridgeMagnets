/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.StartupCommand
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.controller.commands
{
	import uk.co.lmfm.cat.client.fridgemagnets.services.ISocketService;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author soulwire
	 */
	public class StartupCommand extends Command
	{
		[Inject]
		public var socketService : ISocketService;
		
		override public function execute() : void
		{
			trace(this, "execute", socketService);
			socketService.connect();
		}

	}
}
