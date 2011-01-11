//
//  PowerUp.h
//  FRIkanoid
//
//  Created by jsantos on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface PowerUp : NSObject<IAxisAlignedRectangleCollider, ILifetime, ICustomCollider, IMovable, ISceneUser, ICustomUpdate> {
	Vector2 *position;
	Vector2 *velocity;
	float width;
	float height;
	PowerUpType type;
	NSTimeInterval duration;
	BOOL active;
	Pad *parent;
	Lifetime *lifetime;
	id<IScene> scene;
}

- (id) initWithType:(PowerUpType)theType;
- (id) initWithType:(PowerUpType)theType duration:(NSTimeInterval)theDuration;

@property (nonatomic) PowerUpType type;

- (void) activateWithParent:(Pad*)theParent;
- (void) deactivate;

@end
