//
//  FlightStatusQueryViewController.m
//  AirlineDemo
//
//  Created by Rohini on 04/09/13.
//
//

#import "FlightStatusQueryViewController.h"

@interface FlightStatusQueryViewController ()

@end

@implementation FlightStatusQueryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"WebViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.title = @"Flight Status";
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
    return @"flightStatusQuery";
}

@end
