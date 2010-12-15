//
//  AIPlayer.h
//  FRIkanoid
//
//  Created by jsantos on 12/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface AIPlayer : Player {
	Level *level;
	
	//AI player properties
	float speed;
	float attackSpeed;
	NSMutableArray *defenseSpots;
	
	@private
	BOOL attack;
	Vector2 *target;
}

- (id) initWithGame:(Game *)theGame pad:(Pad *)thePad level:(Level*)theLevel;

@property (nonatomic, readonly) Level *level;
@property (nonatomic, readonly) Vector2 *target;

//Percepts
//- (NSArray*) getDefenseDangers;
//- (NSArray*) getOffenseWeaknesses;

//Actions
//- (void) moveTowards:(Vector2*)theTarget;
//- (void) attackTowards:(Vector2*)theTarget;

@end
