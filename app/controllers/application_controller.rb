class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :background_header, :button_attend,  :color, :background, :box_shadow, :background_corners, :img_show, :header_background, :corner_card

  def color
    @color = cookies[:theme] == "light" ? "black" : "white"
  end

  def box_shadow
    @box_shadow = cookies[:theme] == "light" ? "0px;" : "0 8px 32px 0 rgba(31, 38, 135, 0.37);"
  end

  def background
    @background = cookies[:theme] == "light" ? "rgba(255, 255, 255, 0.6);" : "rgba(0, 0, 0, 0.75);"
  end

  def background_header
    @background_header = cookies[:theme] == "light" ? "rgba(255, 255, 255, 0.9);" : "rgba(0, 0, 0, 0.9);"
  end

  def background_corners
    @background_corners = cookies[:theme] == "light" ? "linear-gradient(90deg,#000 2px,transparent 0) 0 0,
    linear-gradient(180deg,#000 2px,transparent 0) 0 0,
    linear-gradient(270deg,#000 2px,transparent 0) 100% 0,
    linear-gradient(180deg,#000 2px,transparent 0) 100% 0,
    linear-gradient(270deg,#000 2px,transparent 0) 100% 100%,
    linear-gradient(0deg,#000 2px,transparent 0) 100% 100%,
    linear-gradient(90deg,#000 2px,transparent 0) 0 100%,
    linear-gradient(0deg,#000 2px,transparent 0) 0 100%;
    background-repeat: no-repeat;
    background-size: 3vh 3vh;
    border: 1px solid black;
    bottom: 0;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transition: 1s;
    width: 100%;
    min-height: 350px;
    height: auto;
    transition: 1s;
    z-index: 12"

    : "linear-gradient(90deg,#fff 1.5px,transparent 0) 0 0,
    linear-gradient(180deg,#fff 1.5px,transparent 0) 0 0,
    linear-gradient(270deg,#fff 1.5px,transparent 0) 100% 0,
    linear-gradient(180deg,#fff 1.5px,transparent 0) 100% 0,
    linear-gradient(270deg,#fff 1.5px,transparent 0) 100% 100%,
    linear-gradient(0deg,#fff 1.5px,transparent 0) 100% 100%,
    linear-gradient(90deg,#fff 1.5px,transparent 0) 0 100%,
    linear-gradient(0deg,#fff 1.5px,transparent 0) 0 100%;
    background-repeat: no-repeat;
    background-size: 3vh 3vh;
    bottom: 0;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transition: 1s;
    width: 100%;
    min-height: 350px;
    height: auto;
    transition: 1s;"
  end

  def header_background
    @header_background = cookies[:theme] == "light" ? "rgba(255, 255, 255, 0.6);" : "rgba(0, 0, 0, 0.75);"
  end

  def corner_card
    @corner_card = cookies[:theme] == "light" ? "linear-gradient(90deg,#000 2px,transparent 0) 0 0,
    linear-gradient(180deg,#000 2px,transparent 0) 0 0,
    linear-gradient(270deg,#000 2px,transparent 0) 100% 0,
    linear-gradient(180deg,#000 2px,transparent 0) 100% 0,
    linear-gradient(270deg,#000 2px,transparent 0) 100% 100%,
    linear-gradient(0deg,#000 2px,transparent 0) 100% 100%,
    linear-gradient(90deg,#000 2px,transparent 0) 0 100%,
    linear-gradient(0deg,#000 2px,transparent 0) 0 100%;
    background-repeat: no-repeat;
    border: 1px solid black;
    background-size: 5px 5px"

    : "linear-gradient(90deg,#fff 1.5px,transparent 0) 0 0,
    linear-gradient(180deg,#fff 1.5px,transparent 0) 0 0,
    linear-gradient(270deg,#fff 1.5px,transparent 0) 100% 0,
    linear-gradient(180deg,#fff 1.5px,transparent 0) 100% 0,
    linear-gradient(270deg,#fff 1.5px,transparent 0) 100% 100%,
    linear-gradient(0deg,#fff 1.5px,transparent 0) 100% 100%,
    linear-gradient(90deg,#fff 1.5px,transparent 0) 0 100%,
    linear-gradient(0deg,#fff 1.5px,transparent 0) 0 100%;
    background-repeat: no-repeat;
    background-size: 5px 5px;
    bottom: 0;"
  end

  def img_show
    @img_show = cookies[:theme] == "light" ? "3px solid #D5F34C;" : "0"
  end

  def button_attend
    @button_attend = cookies[:theme] == "light" ? "black" : "transparent"
  end
end
