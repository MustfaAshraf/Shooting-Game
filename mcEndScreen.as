package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class mcEndScreen extends MovieClip {
        public var mcPlayAgain:MovieClip;

        public function mcEndScreen() {
            if (mcPlayAgain) {
                mcPlayAgain.buttonMode = true;
                mcPlayAgain.addEventListener(MouseEvent.CLICK, playAgain);
            }
        }

        private function playAgain(e:MouseEvent):void {
            dispatchEvent(new Event("PLAY_AGAIN"));
        }

        public function hideScreen():void {
            this.visible = false;
        }

        public function showScreen():void {
            this.visible = true;
        }
    }
}
