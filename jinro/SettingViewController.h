//
//  SettingViewController.h
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/17.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UITableViewController
{
    long number[8];
    
    
    //stepper・label関連付け
    IBOutlet UIStepper *Nstepper;
    IBOutlet UILabel *Nlabel;
    
    IBOutlet UIStepper *Pstepper;
    IBOutlet UILabel *Plabel;

    IBOutlet UIStepper *Wstepper;
    IBOutlet UILabel *Wlabel;

    IBOutlet UIStepper *Bstepper;
    IBOutlet UILabel *Blabel;

    IBOutlet UIStepper *Cstepper;
    IBOutlet UILabel *Clabel;

    IBOutlet UIStepper *Dstepper;
    IBOutlet UILabel *Dlabel;

    IBOutlet UIStepper *Mstepper;
    IBOutlet UILabel *Mlabel;

    IBOutlet UIStepper *Fstepper;
    IBOutlet UILabel *Flabel;

}

- (IBAction)Nbtn:(id)sender;
- (IBAction)Pbtn:(id)sender;
- (IBAction)Wbtn:(id)sender;
- (IBAction)Bbtn:(id)sender;
- (IBAction)Cbtn:(id)sender;
- (IBAction)Dbtn:(id)sender;
- (IBAction)Mbtn:(id)sender;
- (IBAction)Fbtn:(id)sender;


@end
