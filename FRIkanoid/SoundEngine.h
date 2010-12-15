//
//  SoundEngine.h
//  FRIkanoid
//
//  Created by jsantos on 12/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Audio.h"
#import "Chomponthis.FRIkanoid.classes.h"

@interface SoundEngine : GameComponent {
	SoundEffect *soundEffects[SoundEffectTypes];
}

+ (void) initializeWithGame:(Game*)game;
+ (void) play:(SoundEffectType)type;

@end
