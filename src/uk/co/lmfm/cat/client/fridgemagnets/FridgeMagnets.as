/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.FridgeMagnets
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets
{
	import flash.display.Sprite;

	/**
	 * @author soulwire
	 */
	public class FridgeMagnets extends Sprite
	{
		protected var context : FridgeMagnetsContext;
		
		public function FridgeMagnets()
		{
			context = new FridgeMagnetsContext(this);
		}
	}
}
