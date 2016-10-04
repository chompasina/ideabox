class Idea < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper
  
  enum quality: %w(swill plausible genius)
  before_validation :sanitize_input
  
  def sanitize_input
    self.body = strip_tags(body)
    self.title = strip_tags(title)
  end
end
