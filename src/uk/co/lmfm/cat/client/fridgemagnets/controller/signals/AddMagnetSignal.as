/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.controller.signals.AddMagnetSignal
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
	public class AddMagnetSignal extends Signal
	{
		public function AddMagnetSignal()
		{
			super(MagnetVO);
		}
	}
}
