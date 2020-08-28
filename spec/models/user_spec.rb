require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to allow_value('caio.agiani@gmail.com').for(:email) }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_uniqueness_of(:auth_token) }


  describe '#info' do
    it 'returns email, created_at and token' do
      user.save!
      allow(Devise).to receive(:friendly_token).and_return('qwertyuiopasdfghjkl')

      expect(user.info).to eq("#{user.email} - #{user.created_at} - #{Devise.friendly_token}")
    end
  end


  # context 'when name is blank' do
  #   before { user.name = ' ' }

  #   it { expect(user).not_to be_valid }
  # end

  # context 'when name is nil' do
  #   before { user.name = nil }

  #   it { expect(user).not_to be_valid }
  # end

  # subject { build(:user) }
  # before { @user = FactoryGirl.build(:user) }

  # it { expect(@user).to respond_to(:email) }

  # it { expect(subject).to respond_to(:email) }

  # it { is_expected.to respond_to(:email) }
  # it { is_expected.to respond_to(:name) }
  # it { is_expected.to respond_to(:password) }
  # it { is_expected.to respond_to(:password_confirmation) }
  # it { is_expected.to be_valid }
end
