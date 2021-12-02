class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one? item_name
    self.freebies.where(item_name: item_name).count > 0
  end

  def give_away dev, freebie
    if freebie.dev.id == self.id
      freebie.update(dev_id: dev.id)
    end
  end
end
