// In the Step Event of obj_health_controller (or another controller object)

if (instance_exists(oPlayer)) {
    // Check if the player falls off the screen (assuming y position goes beyond room height)
    if (oPlayer.y > room_height) {
        // Reduce health
        global.health -= 1;
		global.score -= 10;

        // Hide hearts based on health
        if (global.health == 4) {
            oHeart5.visible = false;
			oPlayer.x = x_coordinate;
			oPlayer.y = y_coordinate;
        }
        if (global.health == 3) {
            oHeart4.visible = false;
			oPlayer.x = x_coordinate;
			oPlayer.y = y_coordinate;
        }
        if (global.health == 2) {
            oHeart3.visible = false;
			oPlayer.x = x_coordinate;
			oPlayer.y = y_coordinate;
        }
        if (global.health == 1) {
            oHeart2.visible = false;
			oPlayer.x = x_coordinate;
			oPlayer.y = y_coordinate;
        }
        if (global.health == 0) {
            oHeart1.visible = false;
            // Trigger Game Over logic when health is 0
            show_message("Game Over! Find your purpose again?");
			room_restart();
        }
    }
}

// In Step Event of oPlayer or obj_health_controller

// Check if global health is 0 and trigger game over
if (global.health <= 0 && !game_over) {
    game_over = true;  // Set game_over flag to true

    // You can also stop the player or set movement to false:
    oPlayer.enabled = false; // Disable player control if needed
}
