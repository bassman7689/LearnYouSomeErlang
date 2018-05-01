-module(recursive).
-export([fac/1,len/1,tail_fac/1,tail_len/1,duplicate/2,tail_duplicate/2,reverse/1,tail_reverse/1, zip/2, lenient_zip/2, tail_zip/2, tail_lenient_zip/2,quicksort/1]).

fac(0) -> 1;
fac(N) -> N*fac(N-1).

len([]) -> 0;
len([_ | T]) -> 1 + len(T).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) -> tail_fac(N-1, N*Acc).

tail_len(L) -> tail_len(L, 0).

tail_len([],Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).

duplicate(0, _) ->
    [];
duplicate(N, Term) ->
    [Term|duplicate(N-1, Term)].

tail_duplicate(N, Term) ->
    tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) -> List;
tail_duplicate(N, Term,List) ->
    tail_duplicate(N-1, Term, [Term|List]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

zip([],[]) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

tail_zip(X,Y) -> tail_zip(X, Y, []).

tail_zip([],[],Acc) -> tail_reverse(Acc);
tail_zip([X|Xs],[Y|Ys],Acc) -> tail_zip(Xs, Ys, [{X,Y}|Acc]).

tail_lenient_zip(X,Y) -> tail_lenient_zip(X, Y, []).

tail_lenient_zip(_,[],Acc) -> tail_reverse(Acc);
tail_lenient_zip([],_,Acc) -> tail_reverse(Acc);
tail_lenient_zip([X|Xs], [Y|Ys], Acc) -> tail_lenient_zip(Xs, Ys, [{X,Y}|Acc]).

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.
