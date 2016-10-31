FactoryGirl.define do
  factory :tenant do
    nome "IX de Agosto"
    subdomain "ixdeagosto"

    trait :invalid do
      nome nil
    end

    trait :new_tenant do
      nome "IX de Agosto 2"
    end

  end
end
