/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.view.events.MagnetEvent
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.view.events
{
	import flash.events.Event;

	/**
	 * @author soulwire
	 */
	public class MagnetEvent extends Event
	{
		public static const UPDATE : String = "MagnetEvent::update";
		
		public function MagnetEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		override public function clone() : Event
		{
			return super.clone();
		}

	}
}
