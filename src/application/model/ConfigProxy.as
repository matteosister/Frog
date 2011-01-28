package application.model
{
	import application.model.vo.ConfigVO;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class ConfigProxy extends Proxy implements IProxy
	{
		static public const NAME:String = 'ConfigProxy';
		public var configVO:ConfigVO;
		
		public function ConfigProxy(data:Object=null)
		{
			super(NAME, data);
		}
	}
}