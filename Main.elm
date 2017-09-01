module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, text)


main =
    beginnerProgram { model = model, view = view, update = update }

type alias Post = { message : String, votes:Int, id:Int }

type alias Model = List Post


type Msg
    = Vote
    | CreatePost


model : Model
model =
    [ { message = "poo"
      , votes = 0
      , id = 0
      }
    ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Vote ->
            List.map (\post -> {post | votes = (post.votes + 1)}) model

        CreatePost ->
            model


view : Model -> Html Msg
view model =
    div [] [ text "Hello" ]
