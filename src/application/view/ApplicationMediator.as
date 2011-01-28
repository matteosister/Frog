package application.view
{
	import application.ApplicationFacade;
	
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ApplicationMediator";
		
		public function ApplicationMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			drawSomething();
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName()) {
			}
		}
		
		private function drawSomething():void {
			var obj:Sprite = new Sprite();
			with (obj.graphics) {
				beginFill(0x000000, .5);
				drawRect(10, 10, 100, 100);
				endFill();
			}
			frogInstance.addChild(obj);
		}
		
		public function get frogInstance():Frog
		{
			return super.viewComponent as Frog;
		}
	}
}