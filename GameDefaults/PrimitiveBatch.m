//
//  AnimatedSprite.h
//  GameDefaults
//
//  Created by jsantos on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PrimitiveBatch.h"

@interface PrimitiveBatch()

- (void) setProjection;
- (void) apply;
- (void) draw;

@end

Matrix *identity;

@implementation PrimitiveBatch

// Recyclable vertex
static VertexPositionColorStruct vertex;

- (id) initWithGraphicsDevice:(GraphicsDevice *)theGraphicsDevice
{
	self = [super initWithGraphicsDevice:theGraphicsDevice];
	if (self != nil) {
		basicEffect = [[BasicEffect alloc] initWithGraphicsDevice:theGraphicsDevice];
		[self setProjection];
		
		basicEffect.textureEnabled = YES;
		basicEffect.vertexColorEnabled = YES;	
		
		vertexArray = [[VertexPositionColorTextureArray alloc] initWithInitialCapacity:256];
		
		[theGraphicsDevice.deviceReset subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(setProjection)]];
		
	}
	return self;
}

+ (void) initialize {
	identity = [[Matrix identity] retain];
}

- (void) setProjection {
	basicEffect.projection = [Matrix createOrthographicOffCenterWithLeft:-0.5f 
																   right:self.graphicsDevice.viewport.width-0.5f 
																  bottom:self.graphicsDevice.viewport.height-0.5f 
																	 top:-0.5f
															  zNearPlane:0 
															   zFarPlane:-1];
}

- (void) begin {
	[self beginWithBlendState:nil DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:nil];
}

- (void) beginWithBlendState:(BlendState*)theBlendState {
	[self beginWithBlendState:theBlendState DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:nil];
}

- (void) beginWithBlendState:(BlendState*)theBlendState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState {
	[self beginWithBlendState:theBlendState DepthStencilState:theDepthStencilState RasterizerState:theRasterizerState Effect:nil TransformMatrix:nil];
}

- (void) beginWithBlendState:(BlendState*)theBlendState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect {
	[self beginWithBlendState:theBlendState DepthStencilState:theDepthStencilState RasterizerState:theRasterizerState Effect:theEffect TransformMatrix:nil];
}

- (void) beginWithBlendState:(BlendState*)theBlendState 
		 DepthStencilState:(DepthStencilState*)theDepthStencilState 
		   RasterizerState:(RasterizerState*)theRasterizerState 
					Effect:(Effect*)theEffect 
		   TransformMatrix:(Matrix*)theTransformMatrix {
	
	if (!theBlendState) theBlendState = [BlendState alphaBlend];
	if (!theDepthStencilState) theDepthStencilState = [DepthStencilState none];
	if (!theRasterizerState) theRasterizerState = [RasterizerState cullCounterClockwise];
	if (!theEffect) theEffect = basicEffect;
	if (!theTransformMatrix) theTransformMatrix = [Matrix identity];
	
	blendState = theBlendState;
	depthStencilState = theDepthStencilState;
	rasterizerState = theRasterizerState;
	effect = theEffect;
	
	if ([effect isKindOfClass:[BasicEffect class]]) {
		((BasicEffect*)effect).world = theTransformMatrix;
	}
		
	beginCalled = YES;
}

- (void) drawPointAt:(Vector2*)position color:(Color*)color {
	[self drawPointAt:position color:color layerDepth:0];
}

- (void) drawPointAt:(Vector2 *)position color:(Color *)color layerDepth:(float)layerDepth {
	[self drawLineFrom:[Vector2 vectorWithX:position.x-0.5f y:position.y-0.5f] to:[Vector2 vectorWithX:position.x+0.5f y:position.y+0.5f] color:color layerDepth:layerDepth];	
}

- (void) drawLineFrom:(Vector2*)start to:(Vector2*)end color:(Color*)color {
	[self drawLineFrom:start to:end color:color layerDepth:0];
}

- (void) drawLineFrom:(Vector2 *)start to:(Vector2 *)end color:(Color *)color layerDepth:(float)layerDepth {
	vertex.color = color.packedValue;
	vertex.position.z = layerDepth;
	
	vertex.position.x = start.data->x;
	vertex.position.y = start.data->y;
	[vertexArray addVertex:&vertex];

	vertex.position.x = end.data->x;
	vertex.position.y = end.data->y;
	[vertexArray addVertex:&vertex];
}

- (void) drawCircleAt:(Vector2 *)center radius:(float)radius divisions:(int)divisions color:(Color *)color {
	[self drawCircleAt:center radius:radius divisions:divisions color:color layerDepth:0];
}

- (void) drawCircleAt:(Vector2 *)center radius:(float)radius divisions:(int)divisions color:(Color *)color layerDepth:(float)layerDepth {
	Vector2 *start = [Vector2 vectorWithX:center.x + radius y:center.y];
	Vector2 *end = [Vector2 zero];
	for (int i = 1; i <= divisions; i++) {
		float angle = (float)i/(float)divisions * M_PI * 2;
		end.x = center.x + radius * cosf(angle);
		end.y = center.y + radius * sinf(angle);
		[self drawLineFrom:start to:end color:color layerDepth:layerDepth];
		[start set:end];
	}
}

- (void) drawRectangleAt:(Vector2*)center width:(float)width height:(float)height color:(Color*)color {
	[self drawRectangleAt:center width:width height:height color:color layerDepth:0];
}

- (void) drawRectangleAt:(Vector2*)center width:(float)width height:(float)height color:(Color*)color layerDepth:(float)layerDepth {
	vertex.color = color.packedValue;
	vertex.position.z = layerDepth;
	
	vertex.position.x = center.data->x - width / 2;
	vertex.position.y = center.data->y - height / 2;
	[vertexArray addVertex:&vertex];
	
	vertex.position.x += width;
	[vertexArray addVertex:&vertex];
	[vertexArray addVertex:&vertex];

	vertex.position.y += height;
	[vertexArray addVertex:&vertex];
	[vertexArray addVertex:&vertex];
	
	vertex.position.x -= width;
	[vertexArray addVertex:&vertex];
	[vertexArray addVertex:&vertex];
	
	vertex.position.y -= height;
	[vertexArray addVertex:&vertex];
}

- (void) end {
	if (!beginCalled) {
		[NSException raise:@"InvalidOperationException" format:@"End was called before begin."];
	}
	
	// Apply the graphics device states.
	[self apply];
	
	// Render the whole array of sprites.
	[self draw];
	
	// Clean up.
	beginCalled = NO;
}

- (void) apply {
	graphicsDevice.blendState = blendState;
	graphicsDevice.depthStencilState = depthStencilState;
	graphicsDevice.rasterizerState = rasterizerState;
	[[effect.currentTechnique.passes objectAtIndex:0] apply];	
}

- (void) draw {
	// Draw the vertex array.
	int lineCount = [vertexArray count] / 2;
	[graphicsDevice drawUserPrimitivesOfType:PrimitiveTypeLineList vertexData:vertexArray vertexOffset:0 primitiveCount:lineCount];
	// Clean up.
	[vertexArray clear];
}

- (void) dealloc
{
	[vertexArray release];
	[super dealloc];
}

@end
