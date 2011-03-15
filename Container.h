#import<Object.h>
#import<Foundation/NSArray.h>
#import<Filter.h>

@interface Container:NSObject{
    NSMutableArray *objects;
}

-(void) printWithPrefix:(NSString*)prefix;
-(void) print;
-(void) addObject:(BioObject*)object;
-(NSMutableArray*) matchingObjects:(Class)objectClass;
-(Container*) filtered:(Filter*)filter;
@end
