module Day3 where
    hashtable :: [(Integer, String)]
    hashtable = [(1, "Dostoyevski"), (2, "Mozart"), (3, "Platon"), (4, "MarcusAurelius")]

    getvalue :: Integer -> Maybe [String]
    getvalue key = Just (map(\(k,v) -> v) (filter(\(k, v) -> k == key) hashtable)) >>= return