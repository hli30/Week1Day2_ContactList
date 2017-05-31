//
//  main.m
//  ContactList
//
//  Created by Harry Li on 2017-05-30.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *input = [[InputCollector alloc] init];
        ContactList *newList = [[ContactList alloc] init];
        
        while (true){
            //Main menu msg
            NSString *userInput = [input inputForPrompt:@"What would you like do next?\n new - Create a new contact \nlist - List all contacts \nquit - Exit Application \nshow - Show Details \nfind - Search Contact\nhistory - Show past three commands entered\n> "];
            [input trackCommandInput:userInput];
            
            if([userInput isEqualToString:@"quit"]) {
                break;
            }
            else if([userInput isEqualToString:@"new"]){
                Contact *newContact = [[Contact alloc]init];
                NSString *email = [[NSString alloc]init];
                
                while(true){
                    email = [input inputForPrompt:@"Please enter new email."];
                    
                    if([newList checkIfContactEmailExists:email]){
                        continue;
                    }else{
                        newContact.email = email;
                        break;
                    }
                }

                newContact.name = [input inputForPrompt:@"Please enter the full name."];
                
                NSString *reply = [input inputForPrompt:@"Add new phone number? (y/n)"];
                if ([reply isEqualToString:@"y"]) {
                    NSString *key = [input inputForPrompt:@"Enter a name for the phone number:"];
                    NSString *object = [input inputForPrompt:@"Enter the new phone number:"];
                    NSMutableDictionary *phoneNumbers = [NSMutableDictionary dictionaryWithObject:object forKey:key];
                    
                    while(true){
                        NSString *reply2 = [input inputForPrompt:@"Add another number? (y/n)"];
                        if([reply2 isEqualToString:@"y"]) {
                            NSString *key2 = [input inputForPrompt:@"Enter a name for the phone number:"];
                            NSString *object2 = [input inputForPrompt:@"Enter the new phone number."];
                            [phoneNumbers setObject:object2 forKey:key2];
                        }else if([reply2 isEqualToString:@"n"]){
                            newContact.number = phoneNumbers;
                            [newList addContact:newContact];
                            break;
                        }
                    }
                    
                }else if([reply isEqualToString:@"n"]){
                    [newList addContact:newContact];
                }
            }
            else if([userInput isEqualToString:@"list"]) {
                [newList printContactList];
            }
            else if([userInput isEqualToString:@"show"]){
                NSString *index = [input inputForPrompt:@"Please enter an ID."];
                [newList printContactDetailAtIndex:index];
            }
            else if([userInput isEqualToString:@"find"]){
                NSString *search = [input inputForPrompt:@"Please enter a search string."];
                [newList findContact:search];
            }
            else if([userInput isEqualToString:@"history"]){
                [input printHistory];
            }
            else{
                NSLog(@"Invalid selection.");
            }
        }
    }
    return 0;
}
