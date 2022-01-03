module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  {
    toDoList: List String,
    valueToBeAdded : String
  }


init : Model
init =
  { valueToBeAdded = "", toDoList = [] }



-- UPDATE


type Msg
  = ChangeText String
  | AddItem

renderItem : String -> Html msg
renderItem value =
  div []
    [ text "To do:"
    , text value
    ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeText newValue ->
      { model | valueToBeAdded = newValue }
    AddItem ->
        if model.valueToBeAdded /= "" then
      { model | toDoList = model.valueToBeAdded :: model.toDoList, valueToBeAdded = "" }
      else model


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Add item to list", value model.valueToBeAdded, onInput ChangeText ] []
      , button [ onClick AddItem ] [ text "Add Item" ]
      , div [] ( List.map renderItem model.toDoList )
    ]
