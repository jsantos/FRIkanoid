//
//  IAxisAlignedHalfPlaneCollider.h
//  GameDefaults
//
//  Created by jsantos on 11/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IHalfPlaneColider.h"

@protocol IAxisAlignedHalfPlaneCollider <IHalfPlaneColider>

@property (nonatomic, readonly) AxisAlignedHalfPlane *axisAlignedHalfPlane;

@end
