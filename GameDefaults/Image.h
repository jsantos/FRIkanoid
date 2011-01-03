//
//  Image.h
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Image : NSObject {
	Texture2D *texture;
	Rectangle *sourceRectangle;
	
	Color *color;
	
	Vector2 *position;
	Vector2 *origin;
	Vector2 *scale;
	
	float rotation;
	float layerDepth;
}	

- (id) initWithTexture:(Texture2D*)theTexture position:(Vector2*)thePosition;

@property (nonatomic, retain) Texture2D *texture;
@property (nonatomic, retain) Rectangle *sourceRectangle;

@property (nonatomic, retain) Color *color;

@property (nonatomic, retain) Vector2 *position;
@property (nonatomic, retain) Vector2 *origin;
@property (nonatomic, retain) Vector2 *scale;

@property (nonatomic) float rotation;
@property (nonatomic) float layerDepth;

- (void) setScaleUniform:(float)value;

@end
