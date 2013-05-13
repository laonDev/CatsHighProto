package
{
	import com.devclan.catshigh.server.CatsHighTable;
	import com.devclan.catshigh.view.MainState;
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.utils.Mobile;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
	
	[SWF(width="800", height="480", frameRate="60", backgroundColor="#cccccc")]
	public class CatsHighProto extends StarlingCitrusEngine 
	{
		private var stats:Stats;
		
		public function CatsHighProto()
		{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
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
				setUpStarling(GameData.client, 1, viewPort);
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