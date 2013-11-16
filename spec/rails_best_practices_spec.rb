require 'spec_helper'

describe 'rails_best_practices' do

  it 'should conform' do
    system('rails_best_practices --spec').should be_true
  end

end
