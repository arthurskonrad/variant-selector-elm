module Main exposing (main)

import Browser
import Html exposing (Html)
import ProductVariant exposing (Model, Msg, init, update, view)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
