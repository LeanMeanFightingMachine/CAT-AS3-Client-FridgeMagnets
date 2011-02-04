/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.signals.MagnetUpdatedSignal
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
	public class MagnetUpdatedSignal extends Signal
	{
		public function MagnetUpdatedSignal()
		{
			super(MagnetVO);
		}
	}
}
