//
//  ListViewController.m
//  jinro
//
//  Created by Ryo Eguchi on 2013/11/11.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getdata];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    assignDictionary = [member objectForKey:@"DICTIONARY"];
    NSLog(@"%@",assignDictionary);
    
    membersArray = [assignDictionary allKeys];
    rolesArray = [assignDictionary allValues];
    NSLog(@"%@",membersArray);

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


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.detailTextLabel.text = membersArray[indexPath.row];
    cell.textLabel.text = rolesArray[indexPath.row];
    //UILabel *label1 = (UILabel*)[cell viewWithTag:1];
//    label1.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
