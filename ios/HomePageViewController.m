//
//  HomePageViewController.m
//  AirlineDemo
//
//  Created by Rohini on 04/09/13.
//
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"WebViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.navigationItem.hidesBackButton = YES;
    self.title = @"Home";
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *) pageName
{
    return @"homePage";
}

@end
