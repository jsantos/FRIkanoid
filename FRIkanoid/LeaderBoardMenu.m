//
//  LeaderBoardMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeaderBoardMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation LeaderBoardMenu

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];
		renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
	}
	return self;
}

- (void) initialize{
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	retrotype = [self.game.content load:@"ArkaType12" processor:fontProcessor];
	fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
	fivexfive.lineSpacing = 14;
	
	placeholder = [[Label alloc] initWithFont:retrotype text:@"Coming soon!" position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-80 y:175]];
	placeholder.color = [Color white];
	[scene addItem:placeholder];
	
	buttonBackground = [self.game.content load:@"Button"];
	
	back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:260 width:140 height:32]
										  background:buttonBackground font:retrotype text:@"Back"];
	back.labelColor = [Color black];
	back.labelHoverColor = [Color white];
	back.label.position.x = (self.game.window.clientBounds.width/2)-20;
	[back.backgroundImage setScaleUniform:2];
	[scene addItem:back];
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
	
	
	[super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	for(id item in scene){
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		if (button) {
			[button update];
		}
	}
	
	if (back.wasReleased) {
		[frikanoid popState];
	}
}

- (void) activate {
	[self.game.components addComponent:scene];
	[self.game.components addComponent:renderer];
}

- (void) deactivate {
	[self.game.components removeComponent:scene];
	[self.game.components removeComponent:renderer];
}

- (void) dealloc {
	[logo release];
	[back release];
	[buttonBackground release];
	[retrotype release];
	[fivexfive release];
	[scene release];
	[renderer release];
	[super dealloc];
}

@end
