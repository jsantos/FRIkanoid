//
//  MainMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation MainMenu

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];
		renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
	}
	return self;
}

- (void) initialize {
	//[super initialize];
	[SoundEngine play:Music];
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	retrotype = [self.game.content load:@"ArkaType12" processor:fontProcessor];
	fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
	fivexfive.lineSpacing = 14;
	
	buttonBackground = [self.game.content load:@"Button"];
	
	back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:0 y:150 width:320 height:32] background:buttonBackground font:retrotype text:@"Back"];
	back.labelColor = [Color white];
	back.labelHoverColor = [Color gray];
	back.label.position.x = 160;
	back.label.horizontalAlign = HorizontalAlignCenter;
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
	
	// Buttons
	startGame = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:130 width:140 height:32] 
										  background:buttonBackground font:retrotype text:@"Start Game"];
	startGame.label.position.x = (self.game.window.clientBounds.width/2)-60;
	startGame.labelColor = [Color black];
	startGame.labelHoverColor = [Color white];
	[startGame.backgroundImage setScaleUniform:2];
	[scene addItem:startGame];
	
	options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:180 width:140 height:32] 
										 background:buttonBackground font:retrotype text:@"Options"];
	options.labelColor = [Color black];
	options.labelHoverColor = [Color white];
	options.label.position.x = (self.game.window.clientBounds.width/2)-45;
	[options.backgroundImage setScaleUniform:2];
	[scene addItem:options];
	
	leaderboards = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:230 width:140 height:32]
									 background:buttonBackground font:retrotype text:@"LeaderBoard"];
	leaderboards.labelColor = [Color black];
	leaderboards.labelHoverColor = [Color white];
	leaderboards.label.position.x = (self.game.window.clientBounds.width/2)-60;
	[leaderboards.backgroundImage setScaleUniform:2];
	[scene addItem:leaderboards];
	
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
	
	GameState *newState = nil;
	
	if (startGame.wasReleased) {
		if (currentGameplay) {
			[self.game.components removeComponent:currentGameplay];
			[currentGameplay release];
		}
		newState = [[GamePlay alloc] initSinglePlayerWithGame:self.game currentLevel:0];
	}
	
	if (options.wasReleased) {
		newState = [[[OptionsMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (leaderboards.wasReleased) {
		newState = [[[LeaderBoardMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState) {
		[frikanoid pushState:newState];
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
	[startGame release];
	[leaderboards release];
	[options release];
	
	[back release];
	[buttonBackground release];
	[retrotype release];
	[fivexfive release];
	[scene release];
	[renderer release];
	[currentGameplay release];
	[super dealloc];
}

@end
