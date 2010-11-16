//
//  IConvecColider.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IConvexColider <NSObject>

@property (nonatomic, readonly) ConvexPolygon *bounds;


@end
