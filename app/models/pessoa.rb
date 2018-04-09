class Pessoa < ActiveRecord::Base
  actable
  belongs_to :cor
  validates :nome,
            :presence => true
end
