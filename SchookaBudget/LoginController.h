//
//  LoginController.h
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchookaWebserviceController.h"


@interface LoginController : UIViewController {
    SchookaWebserviceController *webService;
    
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
}

-(IBAction)login:(id)sender;

@end
