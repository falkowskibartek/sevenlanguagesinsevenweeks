-module(day1).
-export([numberOfWords/1, countToTen/0, errorOrSuccess/1]).

numberOfWords("") -> 1;
numberOfWords(Words) -> [Char | Rest] = Words,
    if Char == 32 -> 1 + numberOfWords(Rest);
    true -> 0 + numberOfWords(Rest)
    end.

countToTen(10) -> 10;
countToTen(N) -> countToTen(N+1).
countToTen() -> countToTen(0).

errorOrSuccess({error, Message}) -> {error, Message};
errorOrSuccess(success) -> success.