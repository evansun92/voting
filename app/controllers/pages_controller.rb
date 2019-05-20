class PagesController < ApplicationController
    def home
        render file: '../views/pages/home.html.erb'
    end
end
