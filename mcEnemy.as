package {
    import flash.display.MovieClip;
    import flash.events.Event;

    public class mcEnemy extends MovieClip {
        // Public variables
        public var sDirection:String;
        
        // Private variables
        private var nSpeed:Number;

        // Constructor
        public function mcEnemy() {
            addEventListener(Event.ADDED_TO_STAGE, onAdd);
        }

        // Event handler for when the object is added to the stage
        private function onAdd(e:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onAdd);
            init();
        }

        // Initialize the enemy
        private function init():void {
            var nEnemies:Number = 4;
            var nRandom:Number = randomNumber(1, nEnemies);
            this.gotoAndStop(nRandom);
            setupStartPosition();
        }

        // Set up the starting position of the enemy
        private function setupStartPosition():void {
            nSpeed = randomNumber(3, 10);
            var nLeftOrRight:Number = randomNumber(1, 2);

            if (nLeftOrRight == 1) {
                this.x = -(this.width / 2);
                sDirection = "R";
            } else {
                this.x = stage.stageWidth + (this.width / 2);
                sDirection = "L";
            }

            var nMinAltitude:Number = stage.stageHeight / 2;
            var nMaxAltitude:Number = (this.height / 2);
            this.y = randomNumber(nMinAltitude, nMaxAltitude);

            startMoving();
        }

        // Start the movement of the enemy
        private function startMoving():void {
            addEventListener(Event.ENTER_FRAME, enemyLoop);
        }

        // Event handler for the enemy's movement
        private function enemyLoop(e:Event):void {
            if (sDirection == "R") {
                this.x += nSpeed;
            } else {
                this.x -= nSpeed;
            }
        }

        // Public function to remove the enemy from the stage
        public function killEnemy():void {
            parent.removeChild(this);
            removeEventListener(Event.ENTER_FRAME, enemyLoop);
        }

        // Function to generate a random number within a specified range
        function randomNumber(low:Number = 0, high:Number = 1):Number {
            return Math.floor(Math.random() * (1 + high - low)) + low;
        }
    }
}
