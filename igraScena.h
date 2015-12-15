//
//  igraScena.h
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright © 2015 Anton Orzes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameKit/GameKit.h>

@interface igraScena : SKScene<GKGameCenterControllerDelegate>
{
    SKAction *repeatCup;
    SKAction *repeatLet;
    SKAction *repeatPad;
    SKAction *puffAction;
    bool cupka,leti,pao;
    SKSpriteNode *oblak1, *oblak2;
    SKSpriteNode *puff;
}

@end
