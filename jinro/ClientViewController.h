//
//  ClientViewController.h
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/18.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    long number[8];
    long allmember;
    long mafiamember;
    IBOutlet UITableView *mytableView;

}
@end
