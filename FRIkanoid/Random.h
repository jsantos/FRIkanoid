//
//  Random.h
//  FRIkanoid
//
//  Created by jsantos on 11/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Random : NSObject {
	
}

+ (int) int;
+ (int) intLessThan:(int)maxValue;
+ (int) intGreaterThanOrEqual:(int)minValue lessThan:(int)maxValue;
+ (float) float;
+ (double) double;

@end
