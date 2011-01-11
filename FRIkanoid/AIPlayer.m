//
//  AIPlayer.m
//  FRIkanoid
//
//  Created by jsantos on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AIPlayer.h"
#import "Chomponthis.FRIkanoid.h"

//@interface AIPlayer ()
//
//- (void) moveTowards:(Vector2 *)theTarget attack:(BOOL)isAttack;
//
//@end

@implementation AIPlayer

- (id) initWithGame:(Game *)theGame pad:(Pad *)thePad level:(Level*)theLevel {
	self = [super initWithGame:theGame pad:thePad];
	if (self != nil) {
		level = theLevel;
	}
	return self;
}

@synthesize level, target;



//Percepts

//- (NSArray*) getDefenseDangers {
//	NSMutableArray *defenseDangers = [NSMutableArray array];
//	if (level.balls) {
//		Ball *ball = (Ball*)[level.balls objectAtIndex:0];
//		defenseSpots = [NSMutableArray array];
//		//From zero to left gap all it's a defense spot
//		float leftGap = level.playerPad.position.x - level.playerPad.width/2;
//		for (int i = 30; i < leftGap; i++) {
//			[defenseSpots addObject:[[Vector2 alloc] initWithX:i y:playerPad.position.y]];
//		}
//		//From right gap to level bounds all it's a defense spot
//		float rightGap = level.playerPad.position.x + level.playerPad.width/2;
//		for (int i = rightGap; i < self.game.window.clientBounds.x; i++) {
//			[defenseSpots addObject:[[Vector2 alloc] initWithX:i y:playerPad.position.y]];
//		}
//		
//		for (Vector2 *defenseSpot in defenseSpots) {
//			Vector2 *difference = [Vector2 subtract:defenseSpot by:ball.position];
//			float distanceDanger = [difference length];
//			
//			[difference normalize];
//			float velocityDanger = [Vector2 dotProductOf:ball.velocity with:difference];
//			
//			float danger = 500 - distanceDanger + (velocityDanger / distanceDanger)*1000;
//			if (danger < 0) {
//				danger = 0;
//			}
//			
//			[defenseDangers addObject:[NSNumber numberWithFloat:danger]];
//		}
//	}
//
//	return defenseDangers;
//}

//Actions

//- (void) moveTowards:(Vector2 *)theTarget{
//	[self moveTowards:theTarget attack:NO];
//}
//
//- (void) moveTowards:(Vector2 *)theTarget attack:(BOOL)isAttack {
//	[target release];
//	
//	if (theTarget.x < 30 || theTarget.x > (self.game.window.clientBounds.x - 30) ) {
//		target = nil;
//		return;
//	}
//	
//	target = [theTarget retain];
//}

//Action Execution
- (void) updateWithGameTime:(GameTime *)gameTime {
//	if (level.balls) {
//		Ball *ball = [level.balls objectAtIndex:0];
//		
//		if (ball.position.x > (playerPad.position.x - 10)) {
//			[playerPad.position add:[Vector2 multiply:[[Vector2 alloc] initWithX:100 y:0] by:gameTime.elapsedGameTime]];
//		} else if (ball.position.x < playerPad.position.x + 10) {
//			[playerPad.position add:[Vector2 multiply:[[Vector2 alloc] initWithX:-100 y:0] by:gameTime.elapsedGameTime]];
//		}
//		
//
//	}
//	
//	if (target) {
//		Vector2 *difference = [Vector2 subtract:target by:playerPad.position];
//		float distance = [difference length];
//		float maxMove = (attack ? attackSpeed : speed) * gameTime.elapsedGameTime;
//		
//		if (distance < maxMove) {
//			[playerPad.position set:target];
//			[target release];
//			target = nil;
//		} else {
//			[[difference normalize] multiplyBy:maxMove];
//			[playerPad.position add:difference];
//		}
//
//	}
}


- (void) dealloc {
	[super dealloc];
}

@end

