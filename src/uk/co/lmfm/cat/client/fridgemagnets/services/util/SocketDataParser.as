/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.services.util.SocketDataParser
 *	
 *	@version 1.00 | Feb 3, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.services.util
{
	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;

	import com.adobe.serialization.json.JSON;
	/**
	 * @author soulwire
	 */
	public class SocketDataParser implements ISocketDataParser
	{
		public function toSocketString(data : *) : String
		{
			return JSON.encode(data);
		}

		public function fromSocketString(data : String) : *
		{
			trace("fromSocketString", data);

			var input : Array = JSON.decode(data);
			var output : Vector.<MagnetVO> = new Vector.<MagnetVO>();
			
			var object : Object;
			var magnet : MagnetVO;
			
			for (var i : int = 0; i < input.length; i++)
			{
				object = input[i];
				
				magnet = new MagnetVO();
				
				magnet.locked = parseBoolean(object.locked);
				magnet.id = object.id;
				
				magnet.x = parseFloat(object.x);
				magnet.y = parseFloat(object.y);

				output[i] = magnet;
			}

			return output;
		}
		
		private function parseBoolean(value : *) : Boolean
		{
			var str : String = String(value).toLowerCase();
			if (str == "true" || str == "yes" || str == "1") return true;
			return false;
		}
		
	}
}
