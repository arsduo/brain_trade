class Subject < ActiveRecord::Base
  belongs_to :category
  has_many :offerings

  attr_accessible :name, :category_id

    def self.search(search)
      if search
        blah = search.split(' ')
        string = blah.join('%')
        where 'name iLIKE ?', "%#{string}%"
      else
        scoped
      end
    end
end
