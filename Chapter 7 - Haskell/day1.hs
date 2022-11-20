module Day1 where
    rev :: [Integer] -> [Integer]
    rev [] = []
    rev (h:t) = rev t ++ [h]

    comb :: [String] -> [(String,String)]
    comb (colors) = [(a,b) | a <- colors, b <- colors]

    mult :: [Integer] -> [(Integer, Integer, Integer)]
    mult (numbers) = [(a,b, a*b) | a <- numbers, b <- numbers]

    colourstates :: [String] -> [(String, String, String, String, String)]
    colourstates (colours) = [
        ("Alabama = " ++ alabama, "Florida = " ++ florida, "Georgia = " ++ georgia, "Mississippi = " ++ mississippi, "Tennessee = " ++ tennessee) | 
        tennessee <- colours,
        mississippi <- colours,
        alabama <- colours,
        georgia <- colours,
        florida <- colours,
        mississippi /= tennessee,
        mississippi /= alabama,
        alabama /= tennessee,
        alabama /= mississippi,
        alabama /= georgia,
        alabama /= florida,
        georgia /= florida,
        georgia /= tennessee]