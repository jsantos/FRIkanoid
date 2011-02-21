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

@synthesize muted;

- (void) initialize {
	muted = NO;
	soundEffects[SoundEffectTypeBallPad] = [self.game.content load:@"BallPad"];
	soundEffects[SoundEffectTypeBallBrick] = [self.game.content load:@"BallBrick"];
	soundEffects[SoundEffectTypeBallLimit] = [self.game.content load:@"BallLimit"];
	soundEffects[SoundEffectTypeLiveLost] = [self.game.content load:@"LiveLost"];
	soundEffects[SoundEffectTypeLevelUp] = [self.game.content load:@"LevelUp"];
	soundEffects[SoundEffectTypePowerUp] = [self.game.content load:@"PowerUp"];
	soundEffects[SoundEffectTypePowerUpCatched] = [self.game.content load:@"PowerUpCatched"];
	soundEffects[Teaser] = [self.game.content load:@"Teaser"];
}

- (void) play:(SoundEffectType)type {
	if (type == MuteSounds) {
		muted = !muted;
	}
	
	if (!muted) {
		[soundEffects[type] play];
	}

}

- (void)stop:(SoundEffectType)type {
	if (muted) {
		[SoundEffect setMasterVolume:0];
	} else {
		[SoundEffect setMasterVolume:1];
	}

}

+ (void) stop:(SoundEffectType)type {
	[instance stop:type];
}

+ (void) play:(SoundEffectType)type {
	[instance play:type];
}

- (SoundEffectInstance*) createInstance:(SoundEffectType)type {
	return [soundEffects[type] createInstance];
}

+ (SoundEffectInstance*) createInstance:(SoundEffectType)type {
	return [instance createInstance:type];
}

- (void) dealloc {
	for (int i = 0; i < SoundEffectTypes; i++) {
		[soundEffects[i] release];
	}
	[super dealloc];
}

@end
