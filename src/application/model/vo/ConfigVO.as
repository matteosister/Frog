package application.model.vo
{
	public class ConfigVO
	{
		public static const BTN_PDF:String = "pdf";
		public static const BTN_SEND:String = "send";
		public static const BTN_PRINT:String = "print";
		public static const BTN_LANG:String = "lang";
		public static const BTN_FULLSCREEN:String = "full";
		
		public var id:int;
		public var title:String;
		public var subtitle:String;
		public var bookPadding:int;
		public var theme:String;
		public var mainColorLight:uint;
		public var mainColorDark:uint;
		public var overlayColor:uint;
		public var overlayAlpha:Number;
		public var numeroPagine:int;
		public var pagesW:int;
		public var pagesH:int;
		public var startPage:int;
		public var maxZoomLevel:Number;
		public var handleSize:int;
		public var loadOnDemand:Boolean;
		public var pdfUrl:String;
		public var howtoUrl:String;
		public var arrSommario:Array = new Array();
		public var debugLinks:Boolean = false;
		public var language:String = '';
		public var otherlanguageurl:String = '';
		public var sendLinkUrl:String = '';
		public var customerUrl:String = '';
		public var baseUrl:String = '';
		public var siteHost:String = '';
		public var logo:String = '';
		public var buttons:Array = new Array();
		
		public function ConfigVO(xml:XML)
		{
			id = xml.child('id').valueOf();
			language = xml.child('lang').valueOf();
			siteHost = xml.child('sitehost').valueOf();
			baseUrl = xml.child('baseurl').valueOf();
			otherlanguageurl = xml.child('otherlangurl').valueOf();
            title = xml.child('title').valueOf();
            subtitle = xml.child('subtitle').valueOf();
            bookPadding = int(xml.child('book_padding').valueOf());
            theme = xml.child('theme').valueOf().toString().toUpperCase();
            mainColorLight = parseInt(xml.child('maincolorlight').valueOf(), 16);
            mainColorDark = parseInt(xml.child('maincolordark').valueOf(), 16);
            overlayColor = parseInt(xml.child('overlaycolor').valueOf(), 16);
            overlayAlpha = xml.child('overlayalpha').valueOf();
            numeroPagine = xml.child('numeropagine').valueOf();
            pagesW = Math.round(xml.child('pagesW').valueOf());
            pagesH = Math.round(xml.child('pagesH').valueOf());
            startPage = xml.child('startpage').valueOf();
            maxZoomLevel = xml.child('maxzoomlevel').valueOf();
            handleSize = xml.child('handlesize').valueOf();
            loadOnDemand = xml.child('loadondemand').valueOf() == 1;
            pdfUrl = xml.child('downloadpdfurl').valueOf();
            sendLinkUrl = xml.child('sendlinkurl').valueOf();
            customerUrl = xml.child('customerurl').valueOf();
            howtoUrl = xml.child('howtourl').valueOf();
            if (xml.sommario.length() > 0) {
              parseSommario(xml.sommario);
            }
            debugLinks = xml.child('debuglinks').valueOf() == 1;
			
			logo = xml.child('logo').valueOf();
			var buttonsStr:String = xml.child('buttons').valueOf();
			parseButtons(buttonsStr);
		}
		
		private function parseButtons(btnStr:String):void {
			if (btnStr === "") {
				return;
			}
			buttons = btnStr.split(",");
		}
		
		private function parseSommario(lista:XMLList):void {
			for each (var bookmark:XML in lista.children()) {
				var summaryObj:Object = new Object();
				summaryObj.pagina = int(bookmark.attribute('page'));
				summaryObj.categoria = bookmark.categoria.valueOf().toString();
				summaryObj.titolo = bookmark.titolo.valueOf().toString();
				arrSommario.push(summaryObj);
			}
		}
	}
}