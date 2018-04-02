FactoryBot.define do
  factory :portfolio do
    name 'Portfolio 1'
    description 'Super portfolio'
  end

  factory :page do
    path 'http://page.test'
    portfolio
  end

  factory :block do
    page
    weight 1
  end

  factory :element do
    weight 1
    block
  end

  factory :link, class: Element::Link do
    title 'Link title'
    target 'http://target.test'
    img 'http://img.test'
    description 'Link description'
    element
  end
end
