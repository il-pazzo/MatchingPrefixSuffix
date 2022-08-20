//
//  main.m
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//
//  Find the longest string matching both beginning and end of a string, but without overlapping.
//
//  Examples:
//
//      1. "aba"  => "a"
//      2. "aaaa" => "aa" (cannot overlap)
//      3. "abaabXabaab" => "abaab" ("ab" would be a solution, but it's not the longest)

#import <Foundation/Foundation.h>
#import "MatchBruteForce.h"
#import "MatchReasonableCandidates.h"
#import "MicrosecondTimer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray<NSString *> * testStrings = @[
            @"aba",
            @"abba",
            @"abcab",
            @"abaabXabaab",
            @"abracadabra",
            @"now is the time for all good men to come to the aid of their country",
            @"now is the time for all good men to come to the aid of their country now",
        ];
        
        NSString * result;
        MicrosecondTimer * runTimer = [[MicrosecondTimer alloc] init];
        
        [runTimer reset];
        for( NSString * testString in testStrings ) {
            
            result = [MatchBruteForce findLongestMatchIn: testString];
            NSLog( @"Brute force: for \"%@\": longest match has length %lu (%@)", testString, result.length, result );
        }
        NSLog( @"MatchBruteForce took %lld µs total", [runTimer microsecondsSinceStart] );
        NSLog( @"" );
        
        [runTimer reset];
        for( NSString * testString in testStrings ) {
            
            result = [MatchReasonableCandidates findLongestMatchIn: testString];
            NSLog( @"Candidates: for \"%@\": longest match has length %lu (%@)", testString, result.length, result );
        }
        NSLog( @"MatchReasonableCandidates took %lld µs total", [runTimer microsecondsSinceStart] );
    }
    return 0;
}
