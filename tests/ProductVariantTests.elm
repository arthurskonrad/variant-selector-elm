module ProductVariantTests exposing (tests)

import Expect exposing (..)
import ProductVariant exposing (Size(..), Color(..), Model, Msg(..), update)
import Test exposing (..)


initialModel : Model
initialModel =
    { selectedColor = Nothing
    , selectedSize = Nothing
    }


tests : Test
tests =
    describe "ProductVariant.update"
        [ describe "selecting color"
            [ test "selecting Red sets selectedColor to Just Red" <|
                \_ ->
                    let
                        updated =
                            update (SelectColor Red) initialModel
                    in
                    Expect.equal updated.selectedColor (Just Red)
            ]
        , describe "selecting size"
            [ test "selecting Medium sets selectedSize to Just Medium" <|
                \_ ->
                    let
                        updated =
                            update (SelectSize Medium) initialModel
                    in
                    Expect.equal updated.selectedSize (Just Medium)
            ]
        ]
