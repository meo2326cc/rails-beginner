require "rails_helper"


RSpec.describe "View", type: :feature do

  let(:task) { create(:task) }
  let(:task_with_time) { attributes_for(:task_with_time) }
  
  let!(:data) do
    taskArray = []
      3.times do |i|
        taskArray << create(:task)
        sleep(1) 
      end
    taskArray
  end

  let(:first_row_time) { Time.parse(find('tbody > tr:first-child > td:nth-child(3)').text) }
  let(:second_row_time) { Time.parse(find('tbody > tr:nth-child(2) > td:nth-child(3)').text) }

  subject { page }

  before(:example) do
    Capybara.current_driver = :selenium_chrome_headless
  end

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
      click_button('新增任務')
    end

    it { is_expected.to have_text('成功新增任務')   }

  end
  
  context "when user fills in the form with time infomations" do

    before do
      visit(new_task_path)
      fill_in( '標題', with: task_with_time[:task_name])
      fill_in( '內容', with: task_with_time[:description])
      fill_in(  id: 'task_done_at', with:  task_with_time[:date])
      click_button('新增任務')
    end

    it { expect( page ) .to have_text( task_with_time[:date] ) }

  end

  context "when user edits the form " do
    
      before do
        visit('/')
        find('tbody > tr:first-child').click_link('編輯') 
        expect(page).to have_text('編輯清單')
        fill_in( '標題', with: task.task_name)
        fill_in( '內容', with: task.description)
        click_button '編輯任務'   
      end

      it { is_expected.to have_text('成功修改任務') }
  end



  context "when user click delete link " do
      before do
      visit('/')
        accept_alert  do
          find('tbody > tr:first-child').click_link('刪除') 
        end
      end
      
      it { is_expected.to have_text('成功刪除任務') }
  end

  context "when data created time is descending" do
    before do
      visit('/')
    end
    it { expect( second_row_time ).to be < first_row_time }
end

end