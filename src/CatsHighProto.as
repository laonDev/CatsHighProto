package
{
	import com.devclan.catshigh.server.CatsHighTable;
	import com.devclan.catshigh.view.BaseState;
	import com.devclan.catshigh.view.MainState;
	
	import citrus.core.starling.StarlingCitrusEngine;
	
	import feathers.controls.ScreenNavigator;
	import feathers.themes.MetalWorksMobileTheme;
	
	import net.hires.debug.Stats;
	
	import starling.animation.Transitions;
	
	[SWF(width="800", height="480", frameRate="60", backgroundColor="#cccccc")]
	public class CatsHighProto extends StarlingCitrusEngine 
	{
		private var stats:Stats;
		
		public function CatsHighProto()
		{
			setUpStarling();
			
			stats = new Stats();
			
			addChild(stats);
			CatsHighTable.prepare();
			
			stats.x = stage.stageWidth - stats.width;
			stats.y = stage.stageHeight - stats.height;
			
			GameData.state = GameConstants.GAME_STATE_IDLE;
			GameData.client = true;
			state = new MainState();
		}
	}
}