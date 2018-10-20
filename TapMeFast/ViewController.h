//
//  ViewController.h
//  TapMeFast
//
//  Created by Mir M. Ahmed on 10/20/18.
//  Copyright © 2018 Mir M. Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    int timeInt;
    int tapInt;
    int gameInt;
}


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startAction:(id)sender;

@end

