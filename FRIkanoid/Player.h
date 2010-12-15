//
//  Player.h
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.h"
#import "Chomponthis.FRIkanoid.classes.h"

@interface Player : GameComponent {
	Pad *playerPad;
	id<IScene> scene;
}

- (id) initWithGame:(Game *)theGame pad:(Pad*)thePad;

//- (id) initWithPad:(Pad*)thePad scene:(id<IScene>)theScene;

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
