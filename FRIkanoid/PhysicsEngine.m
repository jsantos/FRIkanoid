//
//  PhysicsEngine.m
//  FRIkanoid
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhysicsEngine.h"
#import "GameDefaults.Physics.h"
#import "Chomponthis.FRIkanoid.h"
#import "GameDefaults.Scene.Objects.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime{
	NSMutableIndexSet *discardedItems = [NSMutableIndexSet indexSet];
	NSMutableArray *deadItems = [[NSMutableArray alloc] init];
	NSUInteger index = 0;
	NSMutableArray *bonuses = [[NSMutableArray alloc] init];
	NSMutableArray *explosions = [[NSMutableArray alloc] init];
	
	for(id item in level.scene){
		[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
	}
	
	Vector2 *gravity = [Vector2 vectorWithX:0 y:100 * gameTime.elapsedGameTime];
	
	BOOL addBall = NO;
	for (id item in level.scene){
		
		id<ILifetime> lifetime = ([item conformsToProtocol:@protocol(ILifetime)] && [item isKindOfClass:[Explosion class]]) ? (id<ILifetime>)item : nil;		
		
		// Update lifetimes
		if (lifetime) {
			if ([lifetime.lifetime isAlive]) {
				[lifetime.lifetime updateWithGameTime:gameTime];	
			} else {
				[deadItems addObject:lifetime];
			}
		}
		
		if ([item isKindOfClass:[PowerUp class]]) { //Remove missed power-ups
			id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
			if (itemWithPosition) {
				if (itemWithPosition.position.y > self.game.window.clientBounds.height) {
					[discardedItems addIndex:index];
				}
			}
		}
		if (![item isKindOfClass:[PowerUp class]]) { //Avoid collisions between ball and power-up
				for(id lol in level.scene){
					if ([lol isKindOfClass:[Ball class]]) {
						Ball *pex = (Ball*)lol;
						if ([Collision collisionBetween:pex and:item] && [item isKindOfClass:[Brick class]]) {
							//[discardedItems addIndex:index];
							//level.numBricks--;
//							Brick *temp = (Brick*)item;
//							if (temp.powerUpType > 0) {
//								PowerUp *powerUp = [[PowerUp alloc] init];
//								id<IPosition> itemWithPos = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
//								if (itemWithPos) {
//									powerUp.position = itemWithPos.position;
//									powerUp.velocity.x = 0;
//									powerUp.velocity.y = 1;
//									powerUp.type = temp.powerUpType;
//									[bonuses addObject:powerUp];
//									
//									Explosion *explosion = [[[Explosion alloc] initWithGameTime:gameTime] autorelease];
//									explosion.position = itemWithPos.position;
//									
//									[explosions addObject:explosion];
//								}
//							}
						}
					}
				}
			} else if ([Collision collisionBetween:level.playerPad and:item] && [item isKindOfClass:[PowerUp class]]) {
				//Activate Power Up here
//				PowerUp *temp = item;
//				
//				switch (temp.type) {
//					default:
//					case FasterBall:
//						for(id item in level.scene){
//							if ([item isKindOfClass:[Ball class]]) {
//								Ball *ball =  (Ball*)item;
//								if (ball.velocity.x > 0) {
//									ball.velocity.x += 100;
//								} else {
//									ball.velocity.x -= 100;
//								}
//								
//								if (ball.velocity.y > 0) {
//									ball.velocity.y += 100;
//								} else {
//									ball.velocity.y -= 100;
//								}
//							}
//						}
//						break;
//					case SlowerBall:
//						for(id item in level.scene){
//							if ([item isKindOfClass:[Ball class]]) {
//								Ball *ball = (Ball*)item;
//								
//								if (ball.velocity.x > 0) {
//									ball.velocity.x -= 100;
//								} else {
//									ball.velocity.x += 100;
//								}
//								
//								if (ball.velocity.y > 0) {
//									ball.velocity.y -= 100;
//								} else {
//									ball.velocity.y += 100;
//								}
//							}
//						}	
//						break;
//					case BiggerPad:
//						level.playerPad.width += level.playerPad.width*0.3;
//						break;
//					case MultiBall:
//						addBall = YES;
//						break;
//				}
//				[discardedItems addIndex:[level.scene indexOfItem:item]]; //Clear Power Up from scene
			}
		index++;
	}
	
	if (addBall) {
		//Multibal fiufiufiu
	}
	
	[level.scene removeObjectsAtIndexes:discardedItems];
	for (id item in bonuses){
		[level.scene addItem:item];
	}
	
	for (id item in deadItems){
		[level.scene removeObjectIdenticalTo: item];
	}
	
	for (id item in explosions){
		[level.scene addItem:item];
	}
	
	for (id item in level.scene) { //Add gravity to power-up objects
		if ([item conformsToProtocol:@protocol(IMovable)] && [item isKindOfClass:[PowerUp class]]) {
			[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
			id<IMovable> powerUp = item;
			[powerUp.velocity add:gravity];
		}
	}
	[super updateWithGameTime:gameTime];
}

@end
