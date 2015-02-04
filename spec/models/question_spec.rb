require 'rails_helper'

RSpec.describe Question, :type =>  :model  do

  context 'with validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:description) }
  end

end