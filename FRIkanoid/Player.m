//
//  Player.m
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


@implementation Player

- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene {
	self = [super init];
	if (self != nil) {
		playerPad = thePad;
		scene = theScene;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {

}

@end
