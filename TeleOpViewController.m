//
//  TeleOpViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "TeleOpViewController.h"

@interface TeleOpViewController ()

@end

@implementation TeleOpViewController

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
    self.title = @"Tele-Op";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged1:(UIStepper *)sender {
    double value = [sender value];
    
    [self.label1 setText:[NSString stringWithFormat:@"%d", (int)(value)]];
}

- (IBAction)valueChanged2:(UIStepper *)sender {
    double value = [sender value];
    
    [self.label2 setText:[NSString stringWithFormat:@"%d", (int)(value)]];
}

- (IBAction)valueChanged3:(UIStepper *)sender {
    double value = [sender value];
    
    [self.label3 setText:[NSString stringWithFormat:@"%d", (int)(value)]];
}

- (IBAction)valueChanged4:(UIStepper *)sender {
    double value = [sender value];
    
    [self.label4 setText:[NSString stringWithFormat:@"%d", (int)(value)]];
}

-(IBAction)toReviewPeriod:(UIButton*)sender{
    [[NSUserDefaults standardUserDefaults] setObject:self.label1.text forKey:@"highGoalMade"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label2.text forKey:@"highGoalMissed"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label3.text forKey:@"trussMade"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label4.text forKey:@"trussMissed"];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
