package monster
{
	/**
	 * @author  Lee
	 * @e-Mail  seemefly1982@gmail.com
	 * @ver v1.0
	 * @created Nov 21, 2012 11:12:32 AM
	 *
	 */
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Enemy extends MovieClip
	{
		private var ySpeed:Number;
		private var xSpeed:Number;
		private var maxSpeed:Number = 10;
		private var _root:Sprite;
		
		public function Enemy(type:String)
		{
			super();
			stop();
			addEventListener(Event.ADDED, init);
		}
		
		private function init(e:Event):void{
			removeEventListener(Event.ADDED, init);
			_root = Sprite(root);
			addEventListener(Event.ENTER_FRAME, enterFrameHander);
		}
		
		
		private function enterFrameHander(e:Event):void{
			if(hitTestPoint(this._root.mouseX, this._root.mouseY)){
				clean();
			}
			var dx:Number;
			var dy:Number;
			var ang:Number;
			var ro:Number;
			dy = (this._root.mouseY - this.y);
			dx = (this._root.mouseX - this.x);
			ang = Math.atan2(dy, dx);
			this.ySpeed = (Math.sin(ang) * this.maxSpeed);
			this.xSpeed = (Math.cos(ang) * this.maxSpeed);
			this.x = (this.x + this.xSpeed);
			this.y = (this.y + this.ySpeed);
			ro = 0;
			ro = (((Math.atan2((this._root.mouseY - y), (this._root.mouseX - x)) / Math.PI) * 180) - 90);
			this.rotation = (ro + 180);
			
		}
		
		private function clean():void{
			removeEventListener(Event.ENTER_FRAME, enterFrameHander);
			if(parent){
				parent.removeChild(this);
			}
		}
	}
}