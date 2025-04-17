module ProductVariant exposing (Model, Msg, init, update, view)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
    { selectedColor : Maybe Color
    , selectedSize : Maybe Size
    }


type Color
    = Red
    | Blue
    | Green


type Size
    = Small
    | Medium
    | Large


init : Model
init =
    { selectedColor = Nothing
    , selectedSize = Nothing
    }



-- MESSAGES


type Msg
    = SelectColor Color
    | SelectSize Size



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectColor color ->
            { model | selectedColor = Just color }

        SelectSize size ->
            { model | selectedSize = Just size }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "flex-row" ]
        [ viewPreview model
        , viewSelectors model
        ]



-- PREVIEW CIRCLE


viewPreview : Model -> Html msg
viewPreview model =
    let
        circleColor =
            case model.selectedColor of
                Just Red ->
                    "red"

                Just Blue ->
                    "blue"

                Just Green ->
                    "green"

                Nothing ->
                    "lightgray"

        circleSize =
            case model.selectedSize of
                Just Small ->
                    "40px"

                Just Medium ->
                    "60px"

                Just Large ->
                    "80px"

                Nothing ->
                    "40px"
    in
    div [ class "preview-wrapper" ]
        [ div
            [ class "preview-circle"
            , style "width" circleSize
            , style "height" circleSize
            , style "background-color" circleColor
            ]
            []
        ]



-- SELECTORS


viewSelectors : Model -> Html Msg
viewSelectors model =
    div []
        [ text "Select a Color:"
        , div [] (List.map (colorButton model.selectedColor) [ Red, Blue, Green ])
        , text "Select a Size:"
        , div [] (List.map (sizeButton model.selectedSize) [ Small, Medium, Large ])
        ]



-- BUTTON HELPERS


colorButton : Maybe Color -> Color -> Html Msg
colorButton selected current =
    let
        label =
            case current of
                Red ->
                    "Red"

                Blue ->
                    "Blue"

                Green ->
                    "Green"

        isSelected =
            selected == Just current
    in
    button
        [ onClick (SelectColor current)
        , class
            (if isSelected then
                "selected"

             else
                ""
            )
        ]
        [ text label ]


sizeButton : Maybe Size -> Size -> Html Msg
sizeButton selected current =
    let
        label =
            case current of
                Small ->
                    "Small"

                Medium ->
                    "Medium"

                Large ->
                    "Large"

        isSelected =
            selected == Just current
    in
    button
        [ onClick (SelectSize current)
        , class
            (if isSelected then
                "selected"

             else
                ""
            )
        ]
        [ text label ]
