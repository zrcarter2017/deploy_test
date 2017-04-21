class CreateInvestorNoteNotifications < ActiveRecord::Migration
  def change
    create_view :investor_note_notifications
  end
end
