//
//  SchookaWebserviceController.m
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SchookaWebserviceController.h"
#import "SBJSON.h"


@implementation SchookaWebserviceController

-(id)init
{
    return self;
}

-(BOOL)loginWithUsername:(NSString *)username password:(NSString *)password
{
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    
    NSString* variables = [NSString stringWithFormat:@"api=true&email_address=%@&password=%@",username, password];
    
    NSData* postVariables =
    [variables dataUsingEncoding:NSASCIIStringEncoding
            allowLossyConversion:YES];
    
    NSMutableURLRequest* request =
    [[[NSMutableURLRequest alloc] init] autorelease];
    NSString* postLength =
    [NSString stringWithFormat:@"%d", [postVariables length]];
    NSURL* postUrl =
    [NSURL URLWithString:@"http://www.schooka.com/sessions/"];
    
    [request setURL:postUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength
   forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded"
   forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postVariables];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSDictionary *dictionary = [jsonCheck JSONValue];
	if ([[dictionary objectForKey:@"success"] intValue] == 1)
    {
        NSLog(@"Logged in successfully.");
        return YES;
    } else {
        NSLog(@"Not logged in");
        return NO;
    }
}
-(NSMutableArray *)loadAccounts
{
    NSLog(@"loading accounts");
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"http://www.schooka.com/accounts.json"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableArray *accounts = [jsonCheck JSONValue];
    [accounts retain];
    NSLog(@"Loaded %i accounts",[accounts count]);
    return accounts;
}

-(NSMutableArray *)loadEnvelopesForAccount:(NSUInteger)account_id
{
    NSLog(@"loading envelopes for account id %i",account_id);
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    NSString *url_string = [NSString stringWithFormat:@"http://www.schooka.com/accounts/%i.json",account_id];
    NSURL *url = [NSURL URLWithString:url_string];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableArray *envelopes = [jsonCheck JSONValue];
    [envelopes retain];
    NSLog(@"Loaded %i envelopes",[envelopes count]);
    return envelopes;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [jsonData appendData:data];
    NSLog(@"Received data");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *jsonCheck = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];
    
    NSDictionary *dictionary = [jsonCheck JSONValue];
	if ([[dictionary objectForKey:@"success"] intValue] == 1)
    {
        NSLog(@"Logged in successfully.");
    } else {
        NSLog(@"Not logged in");
    }
}
@end
