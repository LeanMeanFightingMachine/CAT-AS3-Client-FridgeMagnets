/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.FridgeMagnetsContext
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets
{
	import uk.co.lmfm.cat.client.fridgemagnets.controller.commands.MagnetUpdatedCommand;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.MagnetUpdatedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.commands.AddMagnetCommand;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.commands.SocketDataRecievedCommand;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.commands.StartupCommand;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.AddMagnetSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.controller.signals.SocketDataRecievedSignal;
	import uk.co.lmfm.cat.client.fridgemagnets.model.MagnetsProxy;
	import uk.co.lmfm.cat.client.fridgemagnets.services.ISocketService;
	import uk.co.lmfm.cat.client.fridgemagnets.services.OfflineSocketService;
	import uk.co.lmfm.cat.client.fridgemagnets.services.util.ISocketDataParser;
	import uk.co.lmfm.cat.client.fridgemagnets.services.util.SocketDataParser;
	import uk.co.lmfm.cat.client.fridgemagnets.view.components.Magnet;
	import uk.co.lmfm.cat.client.fridgemagnets.view.mediators.MagnetMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author soulwire
	 */
	public class FridgeMagnetsContext extends SignalContext
	{
		public function FridgeMagnetsContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}
		
		override public function startup() : void
		{
			// Map proxies
			
			injector.mapSingleton(MagnetsProxy);
			injector.mapSingletonOf(ISocketService, OfflineSocketService);
			injector.mapSingletonOf(ISocketDataParser, SocketDataParser);
			
			// Map signals
			
			signalCommandMap.mapSignalClass(AddMagnetSignal, AddMagnetCommand);
			signalCommandMap.mapSignalClass(MagnetUpdatedSignal, MagnetUpdatedCommand);
			signalCommandMap.mapSignalClass(SocketDataRecievedSignal, SocketDataRecievedCommand);
			
			// Map mediators
			
			mediatorMap.mapView(Magnet, MagnetMediator);
			
			// Map startup
			
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand);
			
			// Get going
			
			super.startup();
		}

	}
}
