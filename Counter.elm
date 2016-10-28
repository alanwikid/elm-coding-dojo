module Counter exposing(..)

import Html exposing(Html, div, h1, li, ul, text, button)
import Html.Attributes exposing(class) 
import String
import Html.App
import Html.Events exposing(onClick)

--
-- Model
--

type alias Model =
    { counter : Int
    , clicks : Int
    }

initialModel : Model
initialModel = 
    { counter = 0
    , clicks = 0
    }

--
-- Update
--
type Msg 
    = Increment 
    | Decrement
         

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
           { counter = model.counter + 1
           , clicks = model.clicks + 1
           }
        Decrement ->
           { counter = model.counter - 1
           , clicks = model.clicks + 1
           }

-- Model + Msg = Model

--
--View
--
view : Model -> Html Msg
view model =
    div
      []
      [ button [ onClick Decrement ] [ text "-"]
      , h1 [] [ text <| (toString model.counter) ]
      , button [ onClick Increment ] [ text "+ " ]
      , (toString model.clicks) ++ "clicks" |> text 
      ]
{-ul 
   [ class "menu" ] 
   [ li [] [ text "Home" ], 
     li [] [ text "Contact"]
   ]
 -}
 
--Html.div 

--<ul class="menu">
--   <li>Home</li>
--   <li>Contact</li>
--<ul>
 
--Html.text (toString num)

--
-- init
--

main = 
    Html.App.beginnerProgram
      { model = initialModel
      , update = update
      , view = view
      }
 
