//
//  RootViewController.m
//  IOSChallenge1
//

#import "RootViewController.h"
#import "RootViewDataSource.h"
#import "AppDelegate.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = NSLocalizedString(@"IOS Challenge", nil);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // create instance of RootViewDataSource
    _dataSource = [[RootViewDataSource alloc]init];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Add uitableview
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height/2 +50) style: UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;
    
    // Add login button
    _btnSubmit = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,  200, 45)];
    [_btnSubmit setTitle:@"Login" forState:UIControlStateNormal];
    [_btnSubmit setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 +80)];
    [_btnSubmit setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [_btnSubmit setBackgroundColor:[UIColor colorWithRed:51.0/255.0 green:102.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [_btnSubmit addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_btnSubmit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


// Check if password is valid and push to next view. If not valid show alertview
-(void)login:(id)sender {
    [_dataSource validateTextField:_dataSource.txtPassword];
    
    // Is valid push to next view
    if (_dataSource.isValid) {
        SecondViewController *next = [[SecondViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:next animated:YES];
    }
    
    // Either name or password is not valid
    else {
        NSString *errorMessage = NSLocalizedString(@"Password must be atleast 5 characters in length", nil);
        
        if (!StringHasText(_dataSource.txtName.text)) {
            errorMessage = NSLocalizedString(@"Please enter a name", nil);
        }
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

@end
