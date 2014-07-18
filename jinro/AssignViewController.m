//
//  AssignViewController.m
//  Mafia
//
//  Created by Ryo Eguchi on 2013/09/14.
//  Copyright (c) 2013年 Ryo Eguchi. All rights reserved.
//

#import "AssignViewController.h"

@interface AssignViewController ()

@end

@implementation AssignViewController

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
    
    //最初は役職表示を隠しておく。
    youareLabel.hidden = YES;
    beLabel.hidden = YES;
    nextButton.hidden = YES;
    assignLabel.hidden = YES;
    [self shuffle];
    
    //AssignDictionaryを生成
    assignDictionary = [NSMutableDictionary dictionary];
    
    //もし設定をしていなかったら、設定画面に行くように指示。
    /*
    if(allmember == 0){
        UIAlertView *alert =[[UIAlertView alloc]
                             initWithTitle:@"人数を設定してください"
                             message:@"まずはメインメニューの「人数設定」から参加人数を設定してください。"
                             delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
     
     another
        
        [alert show];
     
    }
*/
    

}

//役職シャッフルを開始し、NSUserDefaultに保存
-(void)shuffle{
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
    
    
    //アサインラベルに参加者人数を表示
    pplcountLabel.text = [NSString stringWithFormat:@"1/%ld人目",(long)allmember];
    
    //可変配列を作成し、0〜allmember-1までで順番に割り当てる。
    assignArray = [NSMutableArray array];
    for(int i=0; i < number[0]; i++){
    [assignArray addObject:@"人狼"];
    }
    
    for(int i=0; i < number[1]; i++){
        [assignArray addObject:@"狂人"];
    }
    
    for(int i=0; i < number[2]; i++){
        [assignArray addObject:@"村人"];
    }
    
    for(int i=0; i < number[3]; i++){
        [assignArray addObject:@"占い師"];
    }
    
    for(int i=0; i < number[4]; i++){
        [assignArray addObject:@"霊媒師"];
    }
    
    for(int i=0; i < number[5]; i++){
        [assignArray addObject:@"狩人"];
    }
    
    for(int i=0; i < number[6]; i++){
        [assignArray addObject:@"恋人"];
    }
    
    for(int i=0; i < number[7]; i++){
        [assignArray addObject:@"医者"];
    }
    
    [member setObject:assignArray forKey:@"ARRAY"];

    
    //シャッフルに使う配列
    for (long i=[assignArray count] - 1; i>=0; i--) {
        int j = rand() % (i+1);
        [assignArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    NSLog(@"%@",assignArray);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmBtn:(id)sender {
    //もしnameTextFieldが空だったらplayer nをkeyとして保存するように指定。
    if([nameTextField.text isEqualToString:@""]){
        nameTextField.text = [NSString stringWithFormat:@"player %d",pplcount + 1];
    }
    
    //STEP1 役職表示をON
    if(pplcount + 1 == allmember){
        [nextButton setTitle:@"ゲームスタート！" forState:UIControlStateNormal]; //有効時
    }
    youareLabel.hidden = NO;
    beLabel.hidden = NO;
    nextButton.hidden = NO;
    assignLabel.hidden = NO;
    nameTextField.enabled = NO;
    
    
    //STEP2 役職を表示
    NSString *assign = [assignArray objectAtIndex:pplcount];
    assignLabel.text = assign;
    
    //STEP3 役職を保存
    [assignDictionary setObject:assign forKey:nameTextField.text];


}

- (IBAction)nextBtn:(id)sender {
    if(allmember != pplcount + 1){
    //役職表示を隠しておく。
    youareLabel.hidden = YES;
    beLabel.hidden = YES;
    nextButton.hidden = YES;
    assignLabel.hidden = YES;
    nameTextField.enabled = YES;
    nameTextField.text = @"";
    
    //アサインラベルの表示を更新
    pplcount++;
    pplcountLabel.text = [NSString stringWithFormat:@"%d/%ld人目",pplcount + 1,(long)allmember];
    }else{
        //保存し、画面遷移
        NSUserDefaults *member = [NSUserDefaults standardUserDefaults];
        [member setObject:assignDictionary forKey:@"DICTIONARY"];
        NSLog(@"%@",assignDictionary);
        UIAlertView *alert =[[UIAlertView alloc]
                             initWithTitle:@"確認"
                             message:@"このiPhoneを人狼サーバー使用者（ゲームマスター）に渡してください。"
                             delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
        
        [alert show];
        
    }
}

//OKボタンをおした後に画面遷移
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self performSegueWithIdentifier:@"toPlayView" sender:self];
}


@end
