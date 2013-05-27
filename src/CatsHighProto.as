package
{
	import com.devclan.catshigh.server.CatsHighTable;
	import com.devclan.catshigh.view.BaseState;
	import com.devclan.catshigh.view.MainState;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.utils.Mobile;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	
	[SWF(width="800", height="480", frameRate="60", backgroundColor="#cccccc")]
	public class CatsHighProto extends StarlingCitrusEngine 
	{
		/**
		 * The width that the app is based on, this should be the lowest width such as 320 (iphone) or 384 (ipad) 
		 */
		public static var _baseWidth:Number = 800;
		/**
		 * The height that the app is based on, this should be the lowest height such as 480 (iphone) or 512 (ipad)
		 */
		public static var _baseHeight:Number = 480;
		
		private var stats:Stats;
		
		public function CatsHighProto()
		{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			CatsHighTable.prepare();
			GameData.state = GameConstants.GAME_STATE_IDLE;
			GameData.client = true;
			trace(Mobile.isAndroid(), Mobile.isIOS());
			if(Mobile.isAndroid() || Mobile.isIOS())
			{
				Starling.handleLostContext = true;
				var screenWidth:int = stage.fullScreenWidth;
				var screenHeight:int = stage.fullScreenHeight;
				var viewPort:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight);
//				RectangleUtil.fit(new Rectangle(0, 0, 800, 480), viewPort);
//				setUpStarling(GameData.client, 1);
//				CitrusEngine.getInstance().scaleX = screenWidth / 800;
//				CitrusEngine.getInstance().scaleX = screenHeight / 480;
				setUpStarling(GameData.client, 1, viewPort);
//				CitrusEngine.getInstance().stage.stageWidth = 800;
//				CitrusEngine.getInstance().stage.stageHeight= 480;
//				stage.stageWidth = 800;
//				stage.stageHeight= 480;
				stage.addEventListener( Event.RESIZE, onResizeEventHandler );
				trace("screen", screenWidth, screenHeight);
				trace("Starling.contentScaleFactor", Starling.contentScaleFactor);
			}else
				setUpStarling(GameData.client, 1);
			
//			starling = new 
//			setUpStarling();
			
//			stats.x = stage.stageWidth - stats.width;
//			stats.y = stage.stageHeight - stats.height;
//			var viewPort:Rectangle = RectangleUtil.fit(
//				new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), 
//				new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight), true);
//			var scaleFactor:int = viewPort.width < 480 ? 1 : 2; // midway between 320 and 640
			
//			this._starling.contentScaleFactor = scaleFactor
			
			state = new BaseState();
//			Assets.init();
//			Fonts.init();
		}
		private function updateViewport( $width:Number, $height:Number ):void
		{
			// Resize the Starling viewport with the new width and height
			Starling.current.viewPort = new Rectangle( 0, 0, $width, $height );
			
			if ( !Starling.current || !Starling.current.stage ) return;
			
			// Get the scale based on the biggest percentage between the new width and the base width or the new height and the base height 
			var scale:Number = Math.max(( $width / _baseWidth ), ( $height / _baseHeight ));
			
			// Resize the starling stage based on the new width and height divided by the scale
			Starling.current.stage.stageWidth = ( $width / scale )
			Starling.current.stage.stageHeight = ( $height / scale )
		}
		private function onResizeEventHandler(event:Event):void
		{
			// TODO Auto-generated method stub
			updateViewport( stage.fullScreenWidth, stage.fullScreenHeight );
		}
	}
}