package
{
	import com.devclan.catshigh.server.CatsHighTable;
	import com.devclan.catshigh.view.MainState;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
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
				setUpStarling(GameData.client, 1);
//				CitrusEngine.getInstance().stage.stageWidth = 800;
//				CitrusEngine.getInstance().stage.stageHeight= 480;
//				stage.stageWidth = 800;
//				stage.stageHeight= 480;
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
			state = new MainState();
		}
	}
}