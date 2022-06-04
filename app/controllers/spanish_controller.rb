class SpanishController < ApplicationController
  before_action :set_headers

  def feed
  end

  protected

  def set_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end
