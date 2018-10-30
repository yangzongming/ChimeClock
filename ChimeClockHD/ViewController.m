//
//  ViewController.m
//  ChimeClockHD
//
//  Created by Yang leo on 13-1-10.
//  Copyright (c) 2013年 Shandongjingjixueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:kIsOpen]){
        [timeSwitch setOn:YES];
    }else{
        [timeSwitch setOn:NO];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(IBAction)valueChanged:(id)sender{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if(timeSwitch.on){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kIsOpen];
        [appDelegate addNewLocalClockNotification];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kIsOpen];
        [appDelegate cancelLocalClockNotifation];
    }
}
@end
