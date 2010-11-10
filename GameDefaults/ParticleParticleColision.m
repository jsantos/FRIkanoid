//
//  ParticleParticleColision.m
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleParticleColision.h"
#import "GameDefaults.Scene.Objects.h"


@implementation ParticleParticleColision

+ (void) collisionBetween:(id <IParticleColider>)particle1 and:(id <IParticleColider>)particle2 {
	if ([ParticleParticleColision detectCollisionBetween:particle1 and:particle2]) {
		[ParticleParticleColision resolveCollisionBetween:particle1 and:particle2];
	}
}

+ (BOOL) detectCollisionBetween:(id <IParticleColider>)particle1 and:(id <IParticleColider>)particle2 {
	float distanceBetweenParticles = [[Vector2 subtract:particle1.position by:particle2.position] length];
	return distanceBetweenParticles < particle1.radius + particle2.radius;
}

+ (void) resolveCollisionBetween:(id <IParticleColider>)particle1 and:(id <IParticleColider>)particle2 {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more. We do this by moving both items.
	// We need to calculate by how much to move them apart.
	
	Vector2 *collisionDifference = [Vector2 subtract:particle2.position by:particle1.position];
	float collidedDistance = [collisionDifference length];
	float minimumDistance = particle1.radius + particle2.radius;
	float relaxDistance = minimumDistance - collidedDistance;
	
	// We have to ask, how far we move each item. The default is each half way, but we try to take
	// the mass of the colliders into account, if items have mass.
	
	float relaxPercentage1 = 0.5f;
	float relaxPercentage2 = 0.5f;
	
	// Determine mass of the colliders. If an item has no mass it is considered static,
	// so we should move only the other one. If both have mass, we move them reciprocal to their mass.
	// So a heavier item will move a little and a lighter item more.
	
	float mass1 = [particle1 conformsToProtocol:@protocol(IMass)] ? ((id<IMass>)particle1).mass : 0;
	float mass2 = [particle2 conformsToProtocol:@protocol(IMass)] ? ((id<IMass>)particle2).mass : 0;
	if (mass1 != 0 && mass2 != 0) {
		relaxPercentage1 = mass2 / (mass1 + mass2);
		relaxPercentage1 = mass1 / (mass1 + mass2);
	} else if (mass1 == 0) {
		relaxPercentage1 = 0;
		relaxPercentage2 = 1;
	} else {
		relaxPercentage1 = 1;
		relaxPercentage2 = 0;
	}
	
	// Now we need to turn the percentages into real distances. We move both items along the collision normal
	// for the calculated percentage of the relax distance.
	
	Vector2 *collisionNormal = [[Vector2 vectorWithVector:collisionDifference] normalize];
	[particle1.position subtract:[Vector2 multiply:collisionNormal by:relaxPercentage1 * relaxDistance]];
	[particle2.position add:[Vector2 multiply:collisionNormal by:relaxPercentage2 * relaxDistance]];
	
	// ENERGY EXCHANGE STEP
	
	// We now calculate exchange of energy in a collision with respect to items' momentum. Momentum is mass times
	// velocity so the items need to conform both to IMass and IVelocity. If one of the items does not, it's
	// considered as though there is a collision with a static object.
	
	id <IVelocity> particleWithVelocity1 = [particle1 conformsToProtocol:@protocol(IVelocity)] ? (id<IVelocity>)particle1 : nil;
	id <IVelocity> particleWithVelocity2 = [particle1 conformsToProtocol:@protocol(IVelocity)] ? (id<IVelocity>)particle2 : nil;
	
	Vector2 *velocity1 = particleWithVelocity1 ? particleWithVelocity1.velocity : nil;
	Vector2 *velocity2 = particleWithVelocity2 ? particleWithVelocity2.velocity : nil;

	// In a collision, energy is exchanged only along the collision normal, so we take into account only
	// the speed in the direction of the normal.
	float speed1 = velocity1 ? [Vector2 dotProductOf:velocity1 with:collisionNormal] : 0;
	float speed2 = velocity2 ? [Vector2 dotProductOf:velocity2 with:collisionNormal] : 0;
	float speedDifference = speed1 - speed2;
	
	// We can now calculate the impact impulse (the change of momentum). We take into account the cooeficient
	// of restitution which controls how elastic the collision is. We use a simplified model in which the total
	// COR is just the multiplication of coeficients of both items.
	float cor1 = [particle1 conformsToProtocol:@protocol(ICoefficientOfRestitution)] ? ((id<ICoefficientOfRestitution>)particle1).coefficientOfRestitution : 1;
	float cor2 = [particle2 conformsToProtocol:@protocol(ICoefficientOfRestitution)] ? ((id<ICoefficientOfRestitution>)particle2).coefficientOfRestitution : 1;	
	float cor = cor1 * cor2;
	
	// We prepare mass inverses. If the object is static (has mass of zero), we make the inverse also zero,
	// So the other object will recieve full impact.
	float mass1inverse = mass1 > 0 ? 1.0f / mass1 : 0;
	float mass2inverse = mass2 > 0 ? 1.0f / mass2 : 0;
	
	// We derive the formula for the impact as the change of momentum.
	float impact = -(cor + 1) * speedDifference / (mass1inverse + mass2inverse);
	
	// If we divide the impact with item's mass we get the change in speed. We apply it
	// along the collisions normal. We only do this for non-static items.
	if (mass1 > 0 && particleWithVelocity1) {
		[particleWithVelocity1.velocity add:[Vector2 multiply:collisionNormal by:impact/mass1]];
	}
	
	if (mass2 > 0 && particleWithVelocity2) {
		[particleWithVelocity2.velocity subtract:[Vector2 multiply:collisionNormal by:impact/mass2]];
	}

}



@end
