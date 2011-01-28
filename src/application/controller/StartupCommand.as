package application.controller
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.patterns.command.MacroCommand;

	public class StartupCommand extends MacroCommand implements ICommand
	{
		override protected function initializeMacroCommand():void
        {
            addSubCommand(ModelPrepCommand);
            addSubCommand(ViewPrepCommand);
        }
	}
}