//
//  LoginController.m
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginController.h"
#import "AccountsController.h"


@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        webService = [[SchookaWebserviceController alloc] init];
    }
    return self;
}

-(IBAction)login:(id)sender
{
    NSLog(@"attempting to login to webservice with username:%@ and password:%@",[username text], [password text]);
    BOOL loggedIn = [webService loginWithUsername:[username text] password:[password text]];
    
    if (loggedIn) 
    {
        AccountsController *accountsController = [[AccountsController alloc] init];
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:accountsController];
        
        [accountsController release];
    } else {
        
    }
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
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
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
