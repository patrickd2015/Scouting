//
//  FinalViewController.m
//  ScoutingApp
//
//  Created by Patrick Dong on 8/23/14.
//  Copyright (c) 2014 Patrick Dong. All rights reserved.
//

#import "FinalViewController.h"

@interface FinalViewController ()

@end

@implementation FinalViewController

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
    self.title = @"Ratings";
    
    [self.slider1 addTarget:self
               action:@selector(valueChanged:)
     forControlEvents:UIControlEventValueChanged];
    [self.slider2 addTarget:self
                     action:@selector(valueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [self.slider3 addTarget:self
                     action:@selector(valueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [self.slider4 addTarget:self
                     action:@selector(valueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [self.slider5 addTarget:self
                     action:@selector(valueChanged:)
           forControlEvents:UIControlEventValueChanged];
    [self.slider6 addTarget:self
                     action:@selector(valueChanged:)
           forControlEvents:UIControlEventValueChanged];
}

-(void)valueChanged:(UISlider*)sender{
    [sender setValue:(int)(sender.value + .5) animated:NO];
    self.label1.text = [NSString stringWithFormat:@"%d", (int)self.slider1.value];
    self.label2.text = [NSString stringWithFormat:@"%d", (int)self.slider2.value];
    self.label3.text = [NSString stringWithFormat:@"%d", (int)self.slider3.value];
    self.label4.text = [NSString stringWithFormat:@"%d", (int)self.slider4.value];
    self.label5.text = [NSString stringWithFormat:@"%d", (int)self.slider5.value];
    self.label6.text = [NSString stringWithFormat:@"%d", (int)self.slider6.value];
}

-(IBAction)toNextPeriod:(UIButton*)sender{
    [[NSUserDefaults standardUserDefaults] setObject:self.label1.text forKey:@"shooterRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label2.text forKey:@"inbounderRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label3.text forKey:@"defenderRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label4.text forKey:@"trusserRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label5.text forKey:@"humanRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.label6.text forKey:@"otherRating"];
    [[NSUserDefaults standardUserDefaults] setObject:self.myTextField.text forKey:@"otherName"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.myTextField resignFirstResponder];
    [[NSUserDefaults standardUserDefaults] setObject:self.myTextField.text forKey:@"otherName"];
    return YES;
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
