//
//  MainMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation MainMenu

- (void) initialize {
	[super initialize];
	
	if ([[[MediaPlayer getInstance] queue] count] > 0) {
		[MediaPlayer resume];
	} else {
		Song *menuSong = [self.game.content load:@"sievert-party_dog"];
		[MediaPlayer playSong:menuSong];
	}
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2-logoTexture.width/2) y:30]];
	[scene addItem:logo];
	
	// Buttons
	startGame = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:120 width:140 height:32] 
										  background:buttonBackground font:retrotype text:@"Start Game"];
	//startGame.label.position.x = (self.game.window.clientBounds.width/2)-60;
	startGame.labelColor = [Color black];
	startGame.labelHoverColor = [Color white];
	[startGame.backgroundImage setScaleUniform:2];
	[scene addItem:startGame];
	
	options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:160 width:140 height:32] 
										 background:buttonBackground font:retrotype text:@"Options"];
	options.labelColor = [Color black];
	options.labelHoverColor = [Color white];
	//options.label.position.x = (self.game.window.clientBounds.width/2)-45;
	[options.backgroundImage setScaleUniform:2];
	[scene addItem:options];
	
	leaderboards = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:200 width:140 height:32]
									 background:buttonBackground font:retrotype text:@"LeaderBoard"];
	leaderboards.labelColor = [Color black];
	leaderboards.labelHoverColor = [Color white];
	[leaderboards.backgroundImage setScaleUniform:2];
	[scene addItem:leaderboards];
	
	about = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:240 width:140 height:32]
										  background:buttonBackground font:retrotype text:@"About"];
	about.labelColor = [Color black];
	about.labelHoverColor = [Color white];
	[about.backgroundImage setScaleUniform:2];
	[scene addItem:about];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (startGame.wasReleased) {
		[MediaPlayer pause];
		if (currentGameplay) {
			[self.game.components removeComponent:currentGameplay];
			[currentGameplay release];
		}
		[SoundEngine play:Teaser];
		newState = [[GamePlay alloc] initSinglePlayerWithGame:self.game LevelClass:[frikanoid getLevelClass:0] andScore:0 andLives:1  andLevelNum:0];
		currentGameplay = (GamePlay*)newState;
	}
	
	if (options.wasReleased) {
		newState = [[[OptionsMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (leaderboards.wasReleased) {
		newState = [[[LeaderBoardMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if(about.wasReleased){
		newState = [[[AboutMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState) {
		[frikanoid pushState:newState];
	}
}

- (void) dealloc {
	[logo release];
	[startGame release];
	[leaderboards release];
	[options release];
	[about release];
	
	[currentGameplay release];
	[super dealloc];
}

@end
