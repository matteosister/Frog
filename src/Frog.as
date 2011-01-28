package
{
	import application.ApplicationFacade;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(frameRate="35", backgroundColor="#FFFFFF", width="480", height="800")]
	public class Frog extends Sprite
	{
		public function Frog()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			
			var facade:ApplicationFacade = ApplicationFacade.getInstance();
			facade.startup(this);
		}
	}
}