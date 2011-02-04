/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.services.ISocketService
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.services
{
	/**
	 * @author soulwire
	 */
	public interface ISocketService
	{
		function connect() : void;
		function connected() : void;
		function sendData(data : Array) : void;
		function recieveData(data : String) : void;
	}
}
