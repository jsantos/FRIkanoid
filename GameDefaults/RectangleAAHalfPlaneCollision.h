//
//  RectangleAAHalfPlaneCollision.h
//  GameDefaults
//
//  Created by jsantos on 11/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Math.h"
#import "GameDefaults.Physics.h"
#import "GameDefaults.Scene.Objects.h";

@interface RectangleAAHalfPlaneCollision : NSObject {

}

+ (BOOL) collisionBetween:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle and:(id <IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

+ (BOOL) detectCollisionBetween:(id<IAxisAlignedRectangleCollider>)aaRectangle and:(id<IAxisAlignedHalfPlaneCollider>)aaHalfPlane;

+ (void) resolveCollisionBetween:(id<IAxisAlignedRectangleCollider>)aaRectangle and:(id<IAxisAlignedHalfPlaneCollider>)aaHalfPlane;



@end
