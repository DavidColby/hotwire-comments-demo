class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :project

  after_create_commit { broadcast_before_to [project, :comments], target: "#{dom_id(project)}_comments" }

  validates_presence_of :body
end
