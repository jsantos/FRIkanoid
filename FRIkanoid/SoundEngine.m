//
//  SoundEngine.m
//  FRIkanoid
//
//  Created by jsantos on 12/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundEngine.h"
#import "Retronator.Xni.Framework.Content.h"

SoundEngine *instance;

@implementation SoundEngine;

+ (void) initializeWithGame:(Game*)game{
	instance = [[SoundEngine alloc] initWithGame:game];
	[game.components addComponent:instance];
}

- (void) initialize {
	soundEffects[SoundEffectTypeBallPad] = [self.game.content load:@"BallPad"];
	soundEffects[SoundEffectTypeBallBrick] = [self.game.content load:@"BallBrick"];
	soundEffects[SoundEffectTypeBallBrickWithBonus] = [self.game.content load:@"BallBrickWithBonus"];
	soundEffects[SoundEffectTypeBallLimit] = [self.game.content load:@"BallLimit"];
	soundEffects[SoundEffectTypeLiveLost] = [self.game.content load:@"LiveLost"];
}

- (void) play:(SoundEffectType)type {
	[soundEffects[type] play];
}

+ (void) play:(SoundEffectType)type {
	[instance play:type];
}

- (void) dealloc {
	for (int i = 0; i < SoundEffectTypes; i++) {
		[soundEffects[i] release];
	}
	[super dealloc];
}

@end
