//
//  PlayViewController.m
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/14.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self dayset];
    
}



- (void) dealloc {
    [self.nadView setDelegate:nil];
    // delegate に nil をセット self.nadView = nil; // プロパティ経由でrelease、nil をセット
    //[superdealloc]; //MRC(非ARC時には必要)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//カウントダウン措置
- (IBAction)countSlider:(id)sender {
    countdown = mySlider.value;
    min = countdown /60;
    sec = countdown % 60;
    
    if(sec <10){
        countdownLabel.text = [NSString stringWithFormat:@"0%d:0%d",min,sec];
    }else{
        countdownLabel.text = [NSString stringWithFormat:@"0%d:%d",min,sec];
        
    }
}

- (IBAction)startBtn:(id)sender {
    [counttimer invalidate];
    [self countstart];
}

- (IBAction)stopBtn:(id)sender {
    [counttimer invalidate];
    ope =0;
}

-(void)countstart{
    ope=1;
    counttimer =[NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(hoge:)
                                               userInfo:nil
                                                repeats:YES
                 ];
    [counttimer fire];
}

-(void)hoge:(NSTimer*)timer{
    
    if(countdown >0){
        countdown--;
        min = countdown /60;
        sec = countdown % 60;
        if(sec <10){
            countdownLabel.text = [NSString stringWithFormat:@"0%d:0%d",min,sec];
        }else{
            countdownLabel.text = [NSString stringWithFormat:@"0%d:%d",min,sec];
        }
    }else{
        [counttimer invalidate];
        UIAlertView *alert =[[UIAlertView alloc]
                             initWithTitle:@"タイムアップ"
                             message:@"議論を終了してください。"
                             delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
        
        [alert show];
    }
    mySlider.value = countdown;

}

//日にちによって各種ラベルなどの設定を変える
-(void)dayset{
    switch (day+1) {
        case 1:
            countdown = 90;
            break;
        case 2:
            countdown = 120;
            break;
        case 3:
            countdown = 120;
            break;
        default:
            break;
    }
    min = countdown /60;
    sec = countdown % 60;
    if(sec <10){
        countdownLabel.text = [NSString stringWithFormat:@"0%d:0%d",min,sec];
    }else{
        countdownLabel.text = [NSString stringWithFormat:@"0%d:%d",min,sec];
    }
    
}
@end
