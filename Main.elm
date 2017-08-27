module Main exposing (..)

import Html exposing (Html, beginnerProgram, div, text)


main =
    beginnerProgram { model = model, view = view, update = update }

type Post = { message : String, votes:Int, id:Int }

type Model =
    List { message : String
    , votes : Int
    }


type Msg
    = Vote
    | CreatePost


model : Model
model =
    [ { message = "poo"
      , votes = 0
      }
    ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Vote ->
            List.map (\post -> {post | vote = post.vote+1}) model

        CreatePost ->
            model


view : Model -> Html Msg
view model =
    div [] [ text "Hello" ]
