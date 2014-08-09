//
//  SecondViewController.m
//  IOSChallenge1
//
//


// Cat image from  FreeDigitalPhotos.net

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = NSLocalizedString(@"Second View", nil);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create imageview and set image
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    imgView.image = [UIImage imageNamed:@"cat.jpg"];
    [self.view addSubview:imgView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
