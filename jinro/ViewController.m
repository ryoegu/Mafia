//
//  ViewController.m
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/14.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *member = [NSUserDefaults standardUserDefaults];
    allmember = [member integerForKey:@"ALLMEMBER"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)toassign:(id)sender{
    if(allmember == 0){
        UIAlertView *alert =[[UIAlertView alloc]
                             initWithTitle:@"人数を設定してください"
                             message:@"まずは「人数設定」からゲームに参加する人数を設定してください。"
                             delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
        
        [alert show];
    }else{
    [self performSegueWithIdentifier:@"toAssignView" sender:self];
    }
}

@end
