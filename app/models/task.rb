class Task < ApplicationRecord

  validates :task_name, presence: { message: I18n.t('validation.error_msg') }
  validates :description, presence: { message: I18n.t('validation.error_msg') }
end
