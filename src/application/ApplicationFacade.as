package application
{
	import application.controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const STARTUP:String = 'startup';
		public static const START:String = 'start';
		
		
		// Singleton ApplicationFacade Factory Method
		public static function getInstance():ApplicationFacade
		{
			if ( instance == null ) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		// Register Commands with the Controller
		override protected function initializeController( ):void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		public function startup( app:Frog ):void {
			sendNotification(STARTUP, app);
		}
	}
}

