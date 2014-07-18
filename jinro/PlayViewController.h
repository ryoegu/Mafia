//
//  PlayViewController.h
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/14.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NADView.h"

@interface PlayViewController : UIViewController<NADViewDelegate>
{
    int countdown;
    int min;
    int sec;
    long day;
    
    int ope;
    
    IBOutlet UILabel *countdownLabel;
    IBOutlet UISlider *mySlider;
    
    NSTimer *counttimer;
    
}

@property (nonatomic, retain) NADView * nadView;
- (IBAction)countSlider:(id)sender;
- (IBAction)startBtn:(id)sender;
- (IBAction)stopBtn:(id)sender;

@end
