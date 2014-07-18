//
//  AssignViewController.h
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/14.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignViewController : UIViewController
{
    
    //割り当てた人数
    int pplcount;
    NSInteger allmember;
    NSInteger mafiamember;
    
    long number[8];
    
    NSMutableArray *assignArray;
    NSMutableDictionary *assignDictionary;

    //各種アウトレット
    IBOutlet UITextField *nameTextField;
    IBOutlet UILabel *assignLabel;
    IBOutlet UILabel *pplcountLabel;
    IBOutlet UILabel *youareLabel;
    IBOutlet UILabel *beLabel;
    IBOutlet UIButton *nextButton;
    
}

- (IBAction)confirmBtn:(id)sender;
- (IBAction)nextBtn:(id)sender;

@end
