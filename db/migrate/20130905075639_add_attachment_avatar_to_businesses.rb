class AddAttachmentAvatarToBusinesses < ActiveRecord::Migration
  def self.up
    change_table :businesses do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :businesses, :avatar
  end
end
