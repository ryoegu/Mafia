//
//  SettingViewController.m
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/17.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self udupdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)Nbtn:(id)sender {
    Nlabel.text = [NSString stringWithFormat:@"%d", (int)Nstepper.value];
    number[2] = (long)Nstepper.value;
    [self udsave];
}

- (IBAction)Pbtn:(id)sender {
    Plabel.text = [NSString stringWithFormat:@"%d", (int)Pstepper.value];
    number[3] = (long)Pstepper.value;
    [self udsave];

}

- (IBAction)Wbtn:(id)sender {
    Wlabel.text = [NSString stringWithFormat:@"%d", (int)Wstepper.value];
    number[4] = (long)Wstepper.value;
    [self udsave];

}

- (IBAction)Bbtn:(id)sender {
    Blabel.text = [NSString stringWithFormat:@"%d", (int)Bstepper.value];
    number[5] = (long)Bstepper.value;
    [self udsave];

}

- (IBAction)Cbtn:(id)sender {
    Clabel.text = [NSString stringWithFormat:@"%d", (int)Cstepper.value];
    number[6] = (long)Cstepper.value;
    [self udsave];

}

- (IBAction)Dbtn:(id)sender {
    Dlabel.text = [NSString stringWithFormat:@"%d", (int)Dstepper.value];
    number[7] = (long)Dstepper.value;
    [self udsave];

}

- (IBAction)Mbtn:(id)sender {
    Mlabel.text = [NSString stringWithFormat:@"%d", (int)Mstepper.value];
    number[0] = (long)Mstepper.value;
    [self udsave];

}

- (IBAction)Fbtn:(id)sender {
    Flabel.text = [NSString stringWithFormat:@"%d", (int)Fstepper.value];
    number[1] = (long)Fstepper.value;
    [self udsave];

}

- (void)udsave{
    //全参加者数と人狼側人数を計算
    long member_all = 0;
    for(int i = 0; i<=7;i++){
        member_all = member_all + number[i];
    }
    long member_mafia = number[0] + number[1];
    
    //NSUserDefaultに保存
    NSUserDefaults *member = [NSUserDefaults standardUserDefaults];
    [member setInteger:number[0] forKey:@"M"];
    [member setInteger:number[1] forKey:@"F"];
    [member setInteger:number[2] forKey:@"N"];
    [member setInteger:number[3] forKey:@"P"];
    [member setInteger:number[4] forKey:@"W"];
    [member setInteger:number[5] forKey:@"B"];
    [member setInteger:number[6] forKey:@"C"];
    [member setInteger:number[7] forKey:@"D"];
    [member setInteger:member_all forKey:@"ALLMEMBER"];
    [member setInteger:member_mafia forKey:@"MAFIAMEMBER"];
    [member synchronize];
}

//ユーザーデフォルトから呼び出し、ラベル・stepperに反映
-(void)udupdate{
    NSUserDefaults *member = [NSUserDefaults standardUserDefaults];
    number[0] = [member integerForKey:@"M"];
    number[1] = [member integerForKey:@"F"];
    number[2] = [member integerForKey:@"N"];
    number[3] = [member integerForKey:@"P"];
    number[4] = [member integerForKey:@"W"];
    number[5] = [member integerForKey:@"B"];
    number[6] = [member integerForKey:@"C"];
    number[7] = [member integerForKey:@"D"];
    
    Mlabel.text = [NSString stringWithFormat:@"%ld",number[0]];
    Flabel.text = [NSString stringWithFormat:@"%ld",number[1]];
    Nlabel.text = [NSString stringWithFormat:@"%ld",number[2]];
    Plabel.text = [NSString stringWithFormat:@"%ld",number[3]];
    Wlabel.text = [NSString stringWithFormat:@"%ld",number[4]];
    Blabel.text = [NSString stringWithFormat:@"%ld",number[5]];
    Clabel.text = [NSString stringWithFormat:@"%ld",number[6]];
    Dlabel.text = [NSString stringWithFormat:@"%ld",number[7]];
    
        Mstepper.value = (long)number[0];
        Fstepper.value = (long)number[1];
        Nstepper.value = (long)number[2];
        Pstepper.value = (long)number[3];
        Wstepper.value = (long)number[4];
        Bstepper.value = (long)number[5];
        Cstepper.value = (long)number[6];
        Dstepper.value = (long)number[7];
}
@end
