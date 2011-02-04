/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.view.MagnetMediator
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.view.mediators
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.MagnetUpdatedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.view.events.MagnetEvent;
	import uk.co.lmfm.cat.client.fridgemagnets.view.components.Magnet;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author soulwire
	 */
	public class MagnetMediator extends Mediator
	{
		[Inject]
		public var magnet : Magnet;
		
		[Inject]
		public var magnetUpdatedSignal : MagnetUpdatedSignal;

		override public function onRegister() : void
		{
			magnet.addEventListener(MagnetEvent.UPDATE, onMagnetUpdated);
		}

		private function onMagnetUpdated(event : MagnetEvent) : void
		{
			magnetUpdatedSignal.dispatch(magnet.vo);
		}

	}
}
