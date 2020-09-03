class Admin::IndexController < ApplicationController
  before_action :is_admin?
end
