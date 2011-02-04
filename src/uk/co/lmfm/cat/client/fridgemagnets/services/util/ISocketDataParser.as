/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.services.util.ISocketDataParser
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.services.util
{
	/**
	 * @author soulwire
	 */
	public interface ISocketDataParser
	{
		function toSocketString(data : *) : String;
		function fromSocketString(data : String) : *;
	}
}
