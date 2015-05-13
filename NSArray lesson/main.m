//
//  main.m
//  NSArray lesson
//
//  Created by Oliver Andrews on 2015-05-12.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arrayOfStrings = @[@"eeeeeAAbfdf",
                                    @"Everything",
                                    @"news to me",
                                    @"timepiece",
                                    @"egg",
                                    @"eggs",
                                    @"paper",
                                    @"e",
                                    @"facebook",
                                    @"painting",
                                    @"231 thurlow st",
                                    @"99 bottles"];



        
        
        
        
        NSComparisonResult (^alphabetized)(NSString *, NSString *) = ^NSComparisonResult(NSString *string1, NSString *string2){
            
            
            return [string1 localizedCaseInsensitiveCompare:string2];
        };
        
        NSComparisonResult (^lengthSorted)(NSString *, NSString *) = ^NSComparisonResult(NSString *string1, NSString *string2){
            
            if (string1.length > string2.length) {
                return NSOrderedAscending;
            }
            return NSOrderedDescending;
        };
        
        NSComparisonResult (^reverseAlphabetized)(NSString *, NSString *) = ^NSComparisonResult(NSString *string1, NSString *string2){
            
                NSMutableString *reversedString1 = [NSMutableString stringWithCapacity:[string1 length]];
                NSMutableString *reversedString2 = [NSMutableString stringWithCapacity:[string2 length]];
                
                [string1 enumerateSubstringsInRange:NSMakeRange(0,[string1 length])
                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                        usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                        [reversedString1 appendString:substring];
                        }];
                 [string2 enumerateSubstringsInRange:NSMakeRange(0,[string2 length])
                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                        usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                        [reversedString2 appendString:substring];
                        }];
                return [reversedString1 localizedCaseInsensitiveCompare:reversedString2];
                 };
        NSComparisonResult (^countE)(NSString *, NSString *) = ^NSComparisonResult(NSString *string1, NSString *string2){
            
            int string1Count;
            int string2Count;
            for (int i = 0; i < string1.length-1; i++){
                if ([string1 characterAtIndex:i] == 'e'){
                string1Count++;
                }
            }
            for (int i = 0; i < string2.length-1; i++){
                if ([string2 characterAtIndex:i] == 'e'){
                string2Count++;
                }
            }
        
            if (string1Count < string2Count){
                return NSOrderedAscending;
            }
            if (string2Count < string1Count){
                return NSOrderedDescending;
            }
        
            return NSOrderedSame;
        };
    
        NSArray *sortedByLengthArray = [arrayOfStrings sortedArrayUsingComparator:lengthSorted];
        NSArray *sortedByAlphabet = [arrayOfStrings sortedArrayUsingComparator:alphabetized];

        NSArray *sortedByReverseAlphabet = [arrayOfStrings sortedArrayUsingComparator:reverseAlphabetized];
        
        NSArray *sortedByCountE = [arrayOfStrings sortedArrayUsingComparator:countE];

        NSLog(@"%@",sortedByReverseAlphabet);
    }
    
    return 0;
}
