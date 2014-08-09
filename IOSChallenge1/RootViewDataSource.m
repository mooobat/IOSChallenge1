//
//  RootViewDataSource.m
//  IOSChallenge1
//

#import "RootViewDataSource.h"
#import "AppDelegate.h"

@implementation RootViewDataSource 


-(id)init {
    self = [super init];
    if (self) {
        _items = [[NSArray alloc]initWithObjects:NSLocalizedString(@"Name:", nil), NSLocalizedString(@"Password:", nil), nil];
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _tableView = tableView;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBehind:)];
    recognizer.numberOfTapsRequired = 1;
    recognizer.cancelsTouchesInView = NO;
    [tableView addGestureRecognizer:recognizer];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [_items objectAtIndex:indexPath.row];
    
    // Create uitextfields for name and password
    switch (indexPath.row) {
        // Name uitextfield
        case 0:
            _txtName =  [[UITextField alloc] initWithFrame:CGRectMake(cell.frame.origin.x +110, cell.frame.origin.y, cell.frame.size.width -150, cell.frame.size.height)];
            _txtName.autocapitalizationType = UITextAutocapitalizationTypeNone;
            _txtName.autocorrectionType = UITextAutocorrectionTypeNo;
            _txtName.tag = 0;
            _txtName.delegate = self;
            [cell addSubview:_txtName];
            break;
        // Password uitexfield
        case 1:
            _txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(cell.frame.origin.x +110, cell.frame.origin.y , cell.frame.size.width -150, cell.frame.size.height)];
            _txtPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
            _txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
            // Add action to validate text field when text has changed
            [_txtPassword addTarget:self action:@selector(validateTextField:) forControlEvents:UIControlEventEditingChanged];
            _txtPassword.secureTextEntry = YES;
            _txtPassword.tag = 1;
            _txtPassword.delegate = self;
            [cell addSubview:_txtPassword];
            break;
        default:
            break;
    }
    
    return cell;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(void)handleTapBehind:(UIGestureRecognizer *)recognizer {
    [_txtPassword resignFirstResponder];
    [_txtName resignFirstResponder];
}


// Validate password text field and change border color based on validation
-(void)validateTextField:(UITextField *)textField {
    CGColorRef textColor;
    int txtLength = textField.text.length;
    _isValid = NO;
    
    if (textField.tag == 1) {
        
        if(txtLength  >= 5 ) {
            textColor = [[UIColor greenColor] CGColor];
            _isValid = YES;
        }
        
        else if(txtLength >0 && txtLength <5) {
            textColor = [[UIColor redColor] CGColor];
        }
        
        else if(txtLength == 0) {
            textColor = [[UIColor clearColor]CGColor];
        }
        textField.layer.cornerRadius = 1.0;
        textField.layer.masksToBounds = YES;
        textField.layer.borderColor = textColor;
        textField.layer.borderWidth = 2.0;
    }
    
    
}


@end
