package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class mcBullet extends Sprite 
	{
		public function mcBullet()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
		private function onAdd(e:Event):void
		{
			removeEventListener (Event.ADDED_TO_STAGE, onAdd);
			init();
		}
		private function init():void
		{
			addEventListener (Event.ENTER_FRAME,bulletLoop);
		}
		private function bulletLoop(e:Event):void
		{
			this.y -=10;
		}
		public function killBullet():void
		{
			parent.removeChild(this);
			removeEventListener (Event.ENTER_FRAME,bulletLoop);
		}
	}
}
