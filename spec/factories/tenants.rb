FactoryGirl.define do
  factory :tenant do
    nome "IX de Agosto"
    subdomain "ixdeagosto"

    trait :invalid do
      nome nil
    end

  end
end
