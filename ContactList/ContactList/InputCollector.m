//
//  InputCollector.m
//  ContactList
//
//  Created by Harry Li on 2017-05-30.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *inputs = [NSMutableArray array];
        _inputArray = inputs;
    }
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString{
    char input[255];
    
    NSLog(@"%@", promptString);
    fgets(input, 255, stdin);
   
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    return trimmedString;
}

-(void)trackCommandInput: (NSString *)input{
    [self.inputArray addObject: input];
}

-(void)printHistory{
    if(!(self.inputArray.count >= 3)){
        NSLog(@"Enter at least three commands.\n");
    }else{
        NSLog(@"The last three commands are:\n");
        for(NSInteger i = self.inputArray.count; i > self.inputArray.count - 3; --i) {
            NSString *printCommand = [NSString string];
            printCommand = self.inputArray[i - 1];
            NSLog(@"%@\n", printCommand);
        }
    }
}

@end
