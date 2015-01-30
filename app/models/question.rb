class Questions < ActiceRecord::Base
  inherit_resources

  validates :title, presence: true
end