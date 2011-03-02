//
//  AboutMenu.m
//  FRIkanoid
//
//  Created by jsantos on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation AboutMenu

- (void) initialize {
	[super initialize];
	
	[scene addItem:back];
	[scene addItem:background];
	
	if (self.game.window.clientBounds.width == 1024) {
		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		arkanoid5 = [self.game.content load:@"Steiner16" processor:fontProcessor];
		
		featuring = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Featuring Jorge Santos et al."] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2) y:350]];
		featuring.color = [Color white];
		featuring.position.x = self.game.window.clientBounds.width/2;
		featuring.horizontalAlign = HorizontalAlignCenter;
		[scene addItem:featuring];
		
		doneWith = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Done with XNI Framework:"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2) y:380]];
		doneWith.color = [Color white];
		[doneWith setHorizontalAlign:HorizontalAlignRight];
		[scene addItem:doneWith];
		
		xniLink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 y:380 width:260 height:20] 
										 background:nil font:arkanoid5 text:@"xni.retronator.com"];
		xniLink.labelColor = [Color blue];
		[scene addItem:xniLink];
		
		visitUs = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Visit us at:"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:410]];
		visitUs.color = [Color white];
		[visitUs setHorizontalAlign:HorizontalAlignRight];
		[scene addItem:visitUs];
		
		gameteamLink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 - 50
																				 y:410 width:260 height:20] 
											  background:nil font:arkanoid5 text:@"gameteam.fri.uni-lj.si"];
		gameteamLink.labelColor = [Color blue];
		[scene addItem:gameteamLink];
		
		doneWithin = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Done within TINR course taught by\nMatej Jan, Bojan Klemenc & Peter Peer"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:440]];
		doneWithin.color = [Color white];
		doneWithin.position.x = self.game.window.clientBounds.width/2;
		[doneWithin setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:doneWithin];
		
		address = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Computer Vision Lab\nFaculty of Computer and Information Science\nUniversity of Ljubljana\nSlovenia"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:580]];
		address.color = [Color white];
		address.position.x = self.game.window.clientBounds.width/2;
		[address setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:address];
		
		artwork = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Artwork by Jose Nuno Monsanto\nMusic by"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:500]];
		artwork.color = [Color white];
		artwork.position.x = self.game.window.clientBounds.width/2;
		[artwork setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:artwork];
		
		sievertlink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 - 100
																				y:535 width:260 height:20] 
											 background:nil font:arkanoid5 text:@"Sievert"];
		sievertlink.labelColor = [Color blue];
		[scene addItem:sievertlink];
	} else {
		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		arkanoid5 = [self.game.content load:@"Steiner7" processor:fontProcessor];
		
		featuring = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Featuring Jorge Santos et al."] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2) y:100]];
		featuring.color = [Color white];
		featuring.position.x = self.game.window.clientBounds.width/2;
		featuring.horizontalAlign = HorizontalAlignCenter;
		[scene addItem:featuring];
		
		doneWith = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Done with XNI Framework:"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2) y:115]];
		doneWith.color = [Color white];
		[doneWith setHorizontalAlign:HorizontalAlignRight];
		[scene addItem:doneWith];
		
		xniLink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 y:115 width:260 height:10] 
										 background:nil font:arkanoid5 text:@"xni.retronator.com"];
		xniLink.labelColor = [Color blue];
		xniLink.label.position.y = 123;
		[scene addItem:xniLink];
		
		visitUs = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Visit us at:"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-50 y:135]];
		visitUs.color = [Color white];
		[visitUs setHorizontalAlign:HorizontalAlignRight];
		[scene addItem:visitUs];
		
		gameteamLink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 - 50
																				 y:135 width:260 height:10] 
											  background:nil font:arkanoid5 text:@"gameteam.fri.uni-lj.si"];
		gameteamLink.labelColor = [Color blue];
		gameteamLink.label.position.y = 143;
		[scene addItem:gameteamLink];
		
		doneWithin = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Done within TINR course taught by\nMatej Jan, Bojan Klemenc & Peter Peer"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:150]];
		doneWithin.color = [Color white];
		doneWithin.position.x = self.game.window.clientBounds.width/2;
		[doneWithin setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:doneWithin];
		
		address = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Computer Vision Lab\nFaculty of Computer and Information Science\nUniversity of Ljubljana\nSlovenia"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:208]];
		address.color = [Color white];
		address.position.x = self.game.window.clientBounds.width/2;
		[address setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:address];
		
		artwork = [[Label alloc] initWithFont:arkanoid5 text:[NSString stringWithFormat:@"Artwork by Jose Nuno Monsanto\nMusic by"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:180]];
		artwork.color = [Color white];
		artwork.position.x = self.game.window.clientBounds.width/2;
		[artwork setHorizontalAlign:HorizontalAlignCenter];
		[scene addItem:artwork];
		
		sievertlink = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2 - 50
																				 y:185 width:260 height:10] 
											  background:nil font:arkanoid5 text:@"Sievert"];
		sievertlink.labelColor = [Color blue];
		sievertlink.label.position.y = 200;
		[scene addItem:sievertlink];
	}
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	if (xniLink.wasReleased) {
		NSURL * url = [NSURL URLWithString: @ "http://xni.retronator.com"];
		[[UIApplication sharedApplication] openURL: url];
	}
	
	if (gameteamLink.wasReleased) {
		NSURL * url = [NSURL URLWithString: @ "http://gameteam.fri.uni-lj.si"];
		[[UIApplication sharedApplication] openURL: url];
	}
	
	if (sievertlink.wasReleased) {
		NSURL * url = [NSURL URLWithString: @ "http://www.facebook.com/captainsievert"];
		[[UIApplication sharedApplication] openURL: url];
	}
}

- (void) dealloc {
	[featuring release];
	[doneWith release];
	[doneWithin release];
	[visitUs release];
	[address release];
	[arkanoid5 release];
	[xniLink release];
	[artwork release];
	[gameteamLink release];
	[sievertlink release];
	[super dealloc];
}

@end
