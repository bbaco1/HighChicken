//
//  igraScena.m
//  HighChicken
//
//  Created by Anton Orzes on /9 12/15.
//  Copyright © 2015 Anton Orzes. All rights reserved.
//

#import "igraScena.h"

@implementation igraScena{

    SKSpriteNode *kokos;
    int highScore;
    SKSpriteNode *menuNode;

}




-(void)didMoveToView:(SKView *)view{
    [self dodajKokos];
    [self dodajPod];




}


-(void)dodajKokos{

    kokos = [SKSpriteNode spriteNodeWithImageNamed:@""];
    kokos.size = CGSizeMake(50, 50);
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    kokos.zPosition = 3;
    kokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    
    
    [self addChild:kokos];
    [self dodajMenuNode];


}

-(void)dodajPod {


    SKSpriteNode *pod = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(300, 10)];
    pod.position = CGPointMake(self.size.width/2, self.size.height*0.1);
    pod.zPosition = 1;
    pod.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:pod.size];
    pod.physicsBody.dynamic = NO;
    [self addChild:pod];




}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint p = [[touches anyObject]locationInNode:self];
    SKNode *node = [self nodeAtPoint:p];
    
    
    if (p.y < self.size.height*0.8) {
        
        [kokos.physicsBody applyImpulse:CGVectorMake(0, 25)];
        
        
        
    }
    
   



}

 -(void)dodajMenuNode{
    
     menuNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(200, 200)];
     menuNode.position = CGPointMake(self.size.width/2, -200);
     menuNode.zPosition = 1;
     [self addChild:menuNode];
    
    }

-(void)update:(NSTimeInterval)currentTime{


    if (kokos.position.y > self.size.height*0.7) {
        
        menuNode.position = CGPointMake(self.size.width*0.5, self.size.height*0.5);
        
        
    }





}





@end
