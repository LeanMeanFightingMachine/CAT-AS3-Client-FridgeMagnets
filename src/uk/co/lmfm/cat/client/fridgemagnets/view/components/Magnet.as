/**		
 * 
 *	uk.co.lmfm.cat.client.fridgemagnets.view.components.Magnet
 *	
 *	@version 1.00 | Feb 2, 2011
 *	@author Justin Windle
 *  
 **/
package uk.co.lmfm.cat.client.fridgemagnets.view.components
{
	import assets.MagnetAsset;

	import uk.co.lmfm.cat.client.fridgemagnets.model.data.MagnetVO;
	import uk.co.lmfm.cat.client.fridgemagnets.view.events.MagnetEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author soulwire
	 */
	public class Magnet extends Sprite
	{
		//	----------------------------------------------------------------
		//	PRIVATE MEMBERS
		//	----------------------------------------------------------------
		
		private var _vo : MagnetVO;
		private var _dirty : Boolean = false;
		private var _dragging : Boolean = false;
		private var _asset : MagnetAsset = new MagnetAsset();
		
		//	----------------------------------------------------------------
		//	CONSTRUCTOR
		//	----------------------------------------------------------------
		
		public function Magnet(vo : MagnetVO = null)
		{
			_vo = vo || new MagnetVO();
			
			locked = _vo.locked || false;
			
			x = _vo.x || 0.0;
			y = _vo.y || 0.0;
			
			draw();
		}
		
		//	----------------------------------------------------------------
		//	PUBLIC METHODS
		//	----------------------------------------------------------------
		
		public function enable() : void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			buttonMode = true;
			alpha = 1.0;
		}
		
		public function disable() : void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			buttonMode = false;

			if (!_dragging)
			{
				alpha = 0.1;
			}
		}
		
		//	----------------------------------------------------------------
		//	PRIVATE METHODS
		//	----------------------------------------------------------------
		
		private function draw() : void
		{
			rotation = -15 + Math.random() * 30;
			
			var r : int = Math.random() * 255;
			var g : int = Math.random() * 255;
			var b : int = Math.random() * 255;
			
			_asset.character.textColor = r << 16 | g << 8 | b;
			
			_asset.character.autoSize = TextFieldAutoSize.CENTER;
			_asset.character.text = String.fromCharCode(97 + int(Math.random() * 26));
			_asset.character.mouseEnabled = false;
			
			_asset.x = -_asset.width >> 1;
			_asset.y = -_asset.height >> 1;
			
			addChild(_asset.character);
		}
		
		private function invalidate() : void
		{
			if (!_dirty)
			{
				_dirty = true;
				addEventListener(Event.ENTER_FRAME, onInvalidateEnterFrame);
			}
		}
		
		//	----------------------------------------------------------------
		//	EVENT HANDLERS
		//	----------------------------------------------------------------
		
		private function onInvalidateEnterFrame(event : Event) : void
		{
			removeEventListener(Event.ENTER_FRAME, onInvalidateEnterFrame);
			
			if (_dirty)
			{
				_dirty = false;
				dispatchEvent(new MagnetEvent(MagnetEvent.UPDATE));
			}
		}

		private function onMouseDown(event : MouseEvent) : void
		{
			if(stage)
			{
				locked = _dragging = true;
				
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoved);
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);
				
				startDrag();
			}
		}

		private function onMouseMoved(event : MouseEvent) : void
		{
			_vo.x = x;
			_vo.y = y;
			
			invalidate();
		}

		private function onMouseUp(event : MouseEvent) : void
		{
			locked = _dragging = false;
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoved);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.removeEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			
			stopDrag();
		}
		
		private function onMouseLeave(event : Event) : void
		{
			locked = _dragging = false;
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoved);
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.removeEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			
			stopDrag();
		}
		
		//	----------------------------------------------------------------
		//	PUBLIC ACCESSORS
		//	----------------------------------------------------------------
		
		public function get vo() : MagnetVO
		{
			return _vo;
		}
		
		public function get locked() : Boolean
		{
			return _vo.locked;
		}
		
		public function set locked(value : Boolean) : void
		{
			trace(_dragging);
			_vo.locked = value;
			value ? disable() : enable();
			invalidate();
		}
		
		override public function set x(value : Number) : void
		{
			super.x = _vo.x = value;
			invalidate();
		}
		
		override public function set y(value : Number) : void
		{
			super.y = _vo.y = value;
			invalidate();
		}
	}
}
