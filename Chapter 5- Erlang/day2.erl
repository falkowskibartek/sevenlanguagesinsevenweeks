-module(day2).
-export([getValuesForKeyword/2, transformShoppingList/1]).

getValuesForKeyword(List, Filter) -> 
    FilteredList = lists:filter(fun({Keyword, Value}) -> Keyword == Filter end, List),
    lists:map(fun({Keyword,Value}) -> Value end, FilteredList).

transformShoppingList(List) -> [{Item, Quantity*Price} || {Item, Quantity, Price} <- List].