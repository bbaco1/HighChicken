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
    SKSpriteNode *pobjedonosnaKokos;
    long maxScore;
    long highScore;
    SKSpriteNode *menuNode;
    SKAction *letAction;
    SKAction *moveChicken;
    SKAction *moveChicken2;
    SKSpriteNode *pod;
    SKSpriteNode *playTipka;
    SKSpriteNode *leaderBoard;
    SKAction *moveActions;
    SKSpriteNode *winLose;
    SKTexture *win;
    SKTexture *lose;
    SKTexture *nextTexture;
    SKTexture *playTexture;

}




-(void)didMoveToView:(SKView *)view{
    self.physicsWorld.gravity = CGVectorMake(0, -9);
    [self dodajKokos];
    [self dodajPod];
    [self dodajMenuNode];
    [self dodajBackground];
    [self dodajOgradu];
    [self dodajMenuNode];
    [self dodajOblak];
    



}
-(void)dodajBackground{

    SKSpriteNode *backGround = [SKSpriteNode spriteNodeWithImageNamed:@"podloga2"];
    backGround.size = CGSizeMake(self.size.width, self.size.height);
    backGround.position = CGPointMake(self.size.width/2, self.size.height/2);
    backGround.zPosition = 0;
    [self addChild:backGround];



}


-(void)dodajKokos{
    
    
    [self loadMaxScore];

    highScore = 0;
    
    kokos = [SKSpriteNode spriteNodeWithImageNamed:@"kokaCupka0"];
    kokos.size = CGSizeMake(100, 100);
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    kokos.zPosition = 5;
    kokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    kokos.physicsBody.allowsRotation = NO;
    
    pobjedonosnaKokos = [SKSpriteNode spriteNodeWithImageNamed:@"kokaLeti0"];
    pobjedonosnaKokos.size = CGSizeMake(100, 100);
    pobjedonosnaKokos.position = CGPointMake(-800, self.size.height-400);
    pobjedonosnaKokos.zPosition = 3;
   // pobjedonosnaKokos.physicsBody = [SKPhysicsBody bodyWithTexture:kokos.texture size:kokos.size];
    
    
    
    moveChicken = [SKAction moveTo:CGPointMake(self.size.width+80, self.size.height+40) duration:1];
    moveChicken2 = [SKAction moveTo:CGPointMake(100, 100) duration:1];
    NSArray *array = @[moveChicken, moveChicken2];
    moveActions = [SKAction sequence:array];
    
    [self addChild:kokos];
    [self addChild:pobjedonosnaKokos];
    [self dodajAnimacije];
    


}

-(void)dodajPod {


    pod = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(300, 30)];
    pod.position = CGPointMake(self.size.width/2, self.size.height*0.1);
    pod.zPosition = 1;
    pod.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(300, 10)];
    pod.physicsBody.dynamic = NO;
    [self addChild:pod];




}

-(void)dodajAnimacije{
    
    cupka=false;
    leti=false;
    SKTexture *cup0 = [SKTexture textureWithImageNamed:@"kokaCupka0"];
    SKTexture *cup1 = [SKTexture textureWithImageNamed:@"kokaCupka1"];
    SKTexture *cup2 = [SKTexture textureWithImageNamed:@"kokaCupka2"];
    SKTexture *cup3 = [SKTexture textureWithImageNamed:@"kokaCupka3"];
    SKTexture *cup4 = [SKTexture textureWithImageNamed:@"kokaCupka4"];
   
    NSArray *cupArray = @[cup0, cup1, cup2, cup3, cup4, cup3, cup2, cup1];
    SKAction *cupAction =[SKAction animateWithTextures:cupArray timePerFrame:0.1];
    repeatCup = [SKAction repeatActionForever:cupAction];
    
    SKTexture *let0 = [SKTexture textureWithImageNamed:@"kokaLeti0"];
    SKTexture *let1 = [SKTexture textureWithImageNamed:@"kokaLeti1"];
    SKTexture *let2 = [SKTexture textureWithImageNamed:@"kokaLeti2"];
    SKTexture *let3 = [SKTexture textureWithImageNamed:@"kokaLeti3"];
    SKTexture *let4 = [SKTexture textureWithImageNamed:@"kokaLeti4"];
    SKTexture *let5 = [SKTexture textureWithImageNamed:@"kokaLeti5"];
    
    NSArray *letArray = @[let0, let1, let2, let3, let4, let5, let4, let3, let2, let1];
    letAction =[SKAction animateWithTextures:letArray timePerFrame:0.01];
    repeatLet = [SKAction repeatActionForever:letAction];
    
}

-(void) dodajOgradu{

    SKSpriteNode *trava = [SKSpriteNode spriteNodeWithImageNamed:@"trava"];
    trava.size = CGSizeMake(self.size.width, self.size.height/5);
    trava.position = CGPointMake(self.size.width/2, trava.size.height/2);
    trava.zPosition = 1;
    [self addChild:trava];
    
    SKSpriteNode *ograda = [SKSpriteNode spriteNodeWithImageNamed:@"ograda"];
    ograda.size = CGSizeMake(self.size.width/2-50, self.size.height/2);
    ograda.position = CGPointMake(self.size.width-ograda.size.width/2 - 5, self.size.height/2.8);
    ograda.name = @"ograda";
    ograda.zPosition = 2;
    [self addChild:ograda];

    SKSpriteNode *kuca = [SKSpriteNode spriteNodeWithImageNamed:@"kucica"];
    kuca.size = CGSizeMake(self.size.width/3, self.size.height/6);
    kuca.position = CGPointMake(kuca.size.width/2+30, trava.size.height-10 + kuca.size.height/2);
    kuca.zPosition = 2;
    [self addChild:kuca];
 
}

-(void) dodajOblak{

    oblak1 = [SKSpriteNode spriteNodeWithImageNamed:@"oblak1"];
    oblak1.size = CGSizeMake(160, 80);
    oblak1.position = CGPointMake(self.size.width, self.size.height/1.3);
    oblak1.zPosition = 1;
    [self addChild:oblak1];
    
    oblak2 = [SKSpriteNode spriteNodeWithImageNamed:@"oblak2"];
    oblak2.size = CGSizeMake(160, 80);
    oblak2.position = CGPointMake(self.size.width+120, self.size.height/1.4);
    oblak2.zPosition = 1;
    [self addChild:oblak2];


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint p = [[touches anyObject]locationInNode:self];
    SKNode *node = [self nodeAtPoint:p];
    
    
    if (p.y < self.size.height*0.8 && menuNode.position.y != self.size.height/2) {
        
        [kokos.physicsBody applyImpulse:CGVectorMake(0, 45)];
        
        
        
    }
    
    if ([node.name isEqualToString:@"play"]) {
        
        
        
        [kokos removeAllActions];
        kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
        menuNode.position = CGPointMake(-200, 0);
        
        kokos.physicsBody.dynamic = YES;
        pobjedonosnaKokos.position = CGPointMake(-200, 0);

        [pobjedonosnaKokos removeAllActions];
        
                
    }
    
   



}

 -(void)dodajMenuNode{
    
     menuNode = [SKSpriteNode spriteNodeWithImageNamed:@"izbornik"];
     menuNode.size = CGSizeMake(200, 200);
     menuNode.position = CGPointMake(self.size.width/2, -200);
     menuNode.zPosition = 5;
     menuNode.name = @"menuNode";
     [self addChild:menuNode];
     
     nextTexture = [SKTexture textureWithImageNamed:@"next"];
     playTexture = [SKTexture textureWithImageNamed:@"play"];
     
     playTipka = [SKSpriteNode spriteNodeWithTexture:playTexture];
     playTipka.size = CGSizeMake(100, 50);
     playTipka.position = CGPointMake(0, 60);
     playTipka.zPosition = 1;
     playTipka.name = @"play";
     [menuNode addChild:playTipka];
     
     leaderBoard = [SKSpriteNode spriteNodeWithImageNamed:@"leaderboard"];
     leaderBoard.size = CGSizeMake(150, 50);
     leaderBoard.position = CGPointMake(0, 0);
     leaderBoard.zPosition = 1;
     leaderBoard.name = @"leaderBoard";
     [menuNode addChild:leaderBoard];
     
     win = [SKTexture textureWithImageNamed:@"youWin"];
     lose = [SKTexture textureWithImageNamed:@"youLose"];
     winLose = [SKSpriteNode spriteNodeWithImageNamed:@""];
     winLose.size = CGSizeMake(120, 50);
     winLose.position = CGPointMake(0, 130);
     winLose.zPosition = 2;
     [menuNode addChild:winLose];
    
    }

-(void)update:(NSTimeInterval)currentTime{


    if (kokos.position.y > self.size.height*0.7) {
        
        menuNode.position = CGPointMake(self.size.width*0.5, self.size.height*0.5);
        highScore ++;
        kokos.physicsBody.dynamic = NO;
        pobjedonosnaKokos.position = kokos.position;
        kokos.position = CGPointMake(-200, 0);
        NSLog(@"%ld", highScore);
        [self winGame];
        if (highScore>maxScore) {
            
            [self saveMaxScore];
            
        }
        
        
        
        
    }
    
    if (kokos.physicsBody.velocity.dy < -500 && [kokos intersectsNode:pod]) {
            
            
        NSLog(@"pad");
        [self loseGame];
            
            
            
        }

    
    
    //NSLog(@"brzina je : %f", kokos.physicsBody.velocity.dy);
    
    
    if (kokos.position.y > (self.size.height*0.1+kokos.size.height/2 + 20)){
    
        if(!leti){[kokos runAction:repeatLet];leti=true;cupka=false;}
    
    }
    else{
        
        if(!cupka){[kokos runAction:repeatCup];cupka=true;leti=false;}
    
    }

    CGPoint op= oblak1.position;
    op.x-=0.4;
    
    if(op.x<-oblak1.size.width){
        op.x = self.size.width + oblak1.size.width/2;
        op.y = self.size.height/2 + arc4random() % 300;
        NSString *imeOblaka = [NSString stringWithFormat:@"oblak%d",arc4random() % 5 + 1];
        [oblak1 setTexture:[SKTexture textureWithImageNamed:imeOblaka]];
    }
        
    oblak1.position = op;
    
    op= oblak2.position;
    op.x-=0.3;
    
    if(op.x<-oblak2.size.width){
        op.x = self.size.width + oblak2.size.width/2;
        op.y = self.size.height/2 + arc4random() % 300;
        NSString *imeOblaka = [NSString stringWithFormat:@"oblak%d",arc4random() % 5 + 1];
        [oblak2 setTexture:[SKTexture textureWithImageNamed:imeOblaka]];
    }
    
    oblak2.position = op;

}


-(void)winGame{

    
    moveChicken = [SKAction moveTo:CGPointMake(self.size.width+80, self.size.height+40) duration:1];
    

    [pobjedonosnaKokos runAction:moveChicken];
    [pobjedonosnaKokos runAction:repeatLet];
    
    
    self.physicsWorld.gravity = CGVectorMake(0, -9 - highScore);
    winLose.texture = win;
    playTipka.texture = nextTexture;
    
    
}




-(void)loseGame {

    highScore = 0;
    kokos.position = CGPointMake(self.size.width/2, self.size.height/2);
    pobjedonosnaKokos.position = CGPointMake(self.size.width - 200, self.size.height/2);
    menuNode.position = CGPointMake(self.size.width/2, self.size.height/2);
    self.physicsWorld.gravity = CGVectorMake(0, -9);
    winLose.texture = lose;
    playTipka.texture = playTexture;


}


-(void)saveMaxScore{


    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:maxScore forKey:@"highScore" ];

}

-(void)loadMaxScore{

    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    maxScore = [def integerForKey:@"maxScore"];



}



@end
