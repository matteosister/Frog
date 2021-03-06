package application.controller
{
	import application.view.ApplicationMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new ApplicationMediator(ApplicationMediator.NAME, notification.getBody() as Frog));
		}		
	}
}