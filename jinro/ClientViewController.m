//
//  ClientViewController.m
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/18.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "ClientViewController.h"

@interface ClientViewController ()

@end

@implementation ClientViewController

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
}

//NSUserDefaultからデータを読み込む
-(void)getdata{
    //NSUserDefaultsからデータを読み込む。
    NSUserDefaults *member = [NSUserDefaults standardUserDefaults];
    number[0] = [member integerForKey:@"M"];
    number[1] = [member integerForKey:@"F"];
    number[2] = [member integerForKey:@"N"];
    number[3] = [member integerForKey:@"P"];
    number[4] = [member integerForKey:@"W"];
    number[5] = [member integerForKey:@"B"];
    number[6] = [member integerForKey:@"C"];
    number[7] = [member integerForKey:@"D"];
    allmember = [member integerForKey:@"ALLMEMBER"];
    mafiamember = [member integerForKey:@"MAFIAMEMBER"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//***TableView表示のためのメソッド
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0){
        return allmember - mafiamember;
    }
        return mafiamember;
}

//ヘッダー文字
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"村人チーム";
    }
    return @"人狼チーム";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
    label1.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

@end
