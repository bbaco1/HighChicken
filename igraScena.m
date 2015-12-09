//
//  igraScena.m
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright © 2015 Anton Orzes. All rights reserved.
//

#import "igraScena.h"

@implementation igraScena


-(void)didMoveToView:(SKView *)view{





}


-(void)dodajKokos{

    SKSpriteNode *kokos = [SKSpriteNode spriteNodeWithImageNamed:@""];
    kokos.size = CGSizeMake(50, 50);
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    kokos.zPosition = 3;
    kokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    
    
    [self addChild:kokos];


}

@end
