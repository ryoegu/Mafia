//
//  ListViewController.h
//  jinro
//
//  Created by Ryo Eguchi on 2013/11/11.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
{
    long number[8];
    long allmember;
    long mafiamember;
    IBOutlet UITableView *mytableView;
    
    NSMutableDictionary *assignDictionary;
    
    NSArray *rolesArray;
    NSArray *membersArray;
}
@end
