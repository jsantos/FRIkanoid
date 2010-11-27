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

@interface PowerUp : NSObject<IAxisAlignedRectangleCollider, IMovable> {
	Vector2 *position;
	Vector2 *velocity;
	float width;
	float height;
	PowerUpType type;
}

@property (nonatomic) PowerUpType type;

@end
