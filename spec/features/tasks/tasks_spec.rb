require "rails_helper"


RSpec.describe "View", type: :feature do

  let(:task) { create(:task) }
  let!(:data ) { create(:task)}
  subject { page }

  context "when user view new page " do
    before do
        visit(tasks_path)
        click_link("新增任務")      
    end
        it { is_expected.to have_current_path(new_task_path) }
    end
  

  context "when user fills in the form " do

    before do
      visit(new_task_path)
      fill_in( '標題', with: task.task_name)
      fill_in( '內容', with: task.description)
      click_button('建立任務')
    end

    it { is_expected.to have_text('成功新增任務')   }

  end
  

  context "when user edits the form " do
    
      before do
        visit('/')
        click_link '編輯' 
        expect(page).to have_text('編輯清單')
        fill_in( '標題', with: task.task_name)
        fill_in( '內容', with: task.description)
        click_button '更新文章'   
      end

      it { is_expected.to have_text('成功修改任務') }
  end



  context "when user click delete link " do

      before do
      Capybara.current_driver = :selenium_chrome_headless
      visit('/')
        accept_alert  do
          click_link '刪除'
        end
      end
      
      it { is_expected.to have_text('資料已刪除!') }
  end

end