//
//  FlightSearchViewController.m
//  AirlineDemo
//
//  Created by Rohini on 04/09/13.
//
//

#import "FlightSearchViewController.h"

@interface FlightSearchViewController ()

@end

@implementation FlightSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"WebViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.title = @"Flight Search";
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
    return @"flightSearch";
}


@end
