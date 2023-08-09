# frozen_string_literal: true

class Address < ApplicationRecord
  # association
  # --

  belongs_to :user

  # validation
  # --

  validates :name, presence: true
end
