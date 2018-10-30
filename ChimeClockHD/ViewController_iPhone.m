//
//  ViewController_iPhone.m
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-13.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import "ViewController_iPhone.h"

@interface ViewController_iPhone ()

@end

@implementation ViewController_iPhone
@synthesize timeSwitchLabel;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"整点报时";
    }
    return self;
}

- (void)viewDidLoad
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:kIsOpen]){
        [timeSwitch setOn:YES];
        [timeSwitchLabel setText:@"整点报时开启"];
    }else{
        [timeSwitch setOn:NO];
        [timeSwitchLabel setText:@"整点报时关闭"];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [timeSwitchLabel release];
    [super dealloc];
}

-(IBAction)valueChanged:(id)sender{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if(timeSwitch.on){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsOpen];
        [timeSwitchLabel setText:@"整点报时开启"];
        [appDelegate addNewLocalClockNotification];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kIsOpen];
        [appDelegate cancelLocalClockNotifation];
        [timeSwitchLabel setText:@"整点报时关闭"];
    }
}

@end
