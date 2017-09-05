module Main exposing (..)

import Html.Attributes exposing (style)
import Html exposing (Html, beginnerProgram, div, text, button, p, input, form)
import Html.Events exposing (onClick)

main =
    beginnerProgram { model = model, view = view, update = update }

type alias Post = {
        message : String,
        votes:Int,
        id:Int
    }

type alias Model = List Post


type Msg
    = VoteUp Int
    | VoteDown Int
    | CreatePost


model : Model
model =
    [
     { message = "poo"
      , votes = 0
      , id = 0
     },
     { message = "poo2"
      , votes = 0
      , id = 1
     }
    ]


updatePost : Int -> (Post -> Post) -> Model -> Model
updatePost id f model =
    List.map (\post ->
             if post.id == id then
                 f post
             else post) model

update : Msg -> Model -> Model
update msg model =
    case msg of
        VoteUp id ->
            updatePost id (\post -> {post | votes = post.votes + 1}) model

        VoteDown id ->
            updatePost id (\post -> {post | votes = post.votes - 1}) model

        CreatePost ->
            model


view : Model -> Html Msg
view model =
    div [] <| (List.map viewPost model) ++ [createPostForm]


createPostForm : Html Msg
createPostForm = form [style [("clear", "both")]] [
                   input [] []
                 ]

viewPost : Post -> Html Msg
viewPost post =
    div [style [("clear", "both")]] [
         div [style [("float", "left")]] [
               p [] [text <| "Topic: " ++ post.message],
               p [] [text <| "Votes: " ++ (toString post.votes)]
             ],
         div [style [("float", "left")]] [
               div [] [button [onClick <| VoteUp post.id] [text "Up"]],
               div [] [button [onClick <| VoteDown post.id] [text "Down"]]
             ]
        ]
