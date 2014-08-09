//
//  RootViewController.h
//  IOSChallenge1
//

#import <UIKit/UIKit.h>

@class RootViewDataSource;
@interface RootViewController : UIViewController

@property (nonatomic, strong) RootViewDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *btnSubmit;

@end
