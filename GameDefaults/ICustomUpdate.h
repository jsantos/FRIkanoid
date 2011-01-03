//
//  ICustomUpdate.h
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ICustomUpdate <NSObject>

- (void) updateWithGameTime:(GameTime*)gameTime;

@end
