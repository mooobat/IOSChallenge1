//
//  RootViewDataSource.h
//  IOSChallenge1
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RootViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) UITextField *txtName;
@property (nonatomic, strong) UITextField *txtPassword;

@property (nonatomic, assign) BOOL isValid;

@property (nonatomic, weak) UITableView *tableView;

-(id)init;
-(void)validateTextField:(UITextField *)textField;


@end
