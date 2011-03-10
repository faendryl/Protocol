#include <iostream>
#import <seqan/basic.h>
#import <seqan/find.h>

using namespace seqan;


template <typename TAlgorithm>
void printAllOccs(String<char>& haystack, 
                  String<char>& needle)
{
    Finder<String<char> > finder(haystack);
    Pattern<String<char>, TAlgorithm> pattern(needle);
    while (find(finder, pattern)) 
    {
        ::std::cout << position(finder) << ", ";
    }
    ::std::cout << ::std::endl;
}


void testFunction(const char* tmpl,const char *primer)
{
    std::cout<<"Occurrences"<<std::endl;
    String<char> haystack(tmpl);//="send more money";
    String<char> needle(primer);//="mo";
    printAllOccs<ShiftOr>(haystack,needle);
}
