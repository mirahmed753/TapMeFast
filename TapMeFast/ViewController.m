//
//  ViewController.m
//  TapMeFast
//
//  Created by Mir M. Ahmed on 10/20/18.
//  Copyright © 2018 Mir M. Ahmed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    timeInt = 10;
    tapInt = 0;
    
    // To determine the state of the game:
    // if gameInt is 0, then the game is not in a play position
    // if gameInt is 1, then we can increase the score since the game is in a play state
    gameInt = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
}


- (IBAction)startAction:(id)sender {
    
    if(timeInt == 10) {
        // game is ready to begin
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.5;
        
        // change game state to play state
        gameInt = 1;
    }
    
    if(gameInt == 1) {
        tapInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
    }
    
    else {
        timeInt = 10;
        tapInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", tapInt];
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    }
}


-(void)startCounter {
    timeInt -= 1;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timeInt];
    
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    [self.startButton setTitle:@"Tap" forState:UIControlStateNormal];
    
    if(timeInt == 0) {
        [timer invalidate];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.5;
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        
        [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(restart) userInfo:nil repeats:NO];
    }
}

-(void)restart {
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    
    gameInt = 0;
}

@end
