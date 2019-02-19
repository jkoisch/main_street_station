FactoryBot.define do
  factory :user do
    email { 'this@that.com' }

    factory :local_user do
      transient do
        local_pw  { '123test' }
      end

      after(:create) do |user, evaluator|
        create(:local_authority, user: user, password: evaluator.local_pw,
               password_confirmation: evaluator.local_pw, provider: 'youcentric',
               uid: UUID.generate)
      end
    end
  end
end