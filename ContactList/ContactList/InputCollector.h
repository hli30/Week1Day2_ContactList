//
//  InputCollector.h
//  ContactList
//
//  Created by Harry Li on 2017-05-30.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property NSMutableArray *inputArray;

-(NSString *)inputForPrompt:(NSString *)promptString;
-(void)trackCommandInput:(NSString *)input;
-(void)printHistory;

@end
