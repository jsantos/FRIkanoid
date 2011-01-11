//
//  RectangleRectangleCollision.h
//  GameDefaults
//
//  Created by jsantos on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.Objects.classes.h"

@interface RectangleRectangleCollision : NSObject {

}

+ (BOOL) collisionBetween:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle2;

+ (BOOL) detectCollisionBetween:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle2;

+ (void) resolveCollisionBetween:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle2;

@end
