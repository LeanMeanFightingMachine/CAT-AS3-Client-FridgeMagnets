/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.commands.AddMagnetCommand
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.controller.commands
{
	import uk.co.lmfm.cat.client.fridgemagnets.view.components.Magnet;
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import uk.co.lmfm.cat.client.fridgemagnets.model.MagnetsProxy;

	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author soulwire
	 */
	public class AddMagnetCommand extends SignalCommand
	{
		[Inject]
		public var proxy : MagnetsProxy;
		
		[Inject]
		public var magnet : MagnetVO;
		
		override public function execute() : void
		{
			proxy.addMagnet(magnet);
			contextView.addChild(new Magnet(magnet));
		}

	}
}
