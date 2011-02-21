//
//  Brick.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface Brick : NSObject <IAxisAlignedRectangleCollider, ICustomCollider, ISceneUser>{
	Vector2 *position;
	float width;
	float height;
	int power;
	BrickType brickType;
	PowerUpType powerUpType;
	id<IScene> scene;
	Game *currentGame;

}

@property (nonatomic) BrickType brickType;
@property (nonatomic) PowerUpType powerUpType;
@property (nonatomic) int power;
@property (nonatomic, retain) Game *currentGame;

@end
