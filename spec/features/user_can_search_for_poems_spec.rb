require 'rails_helper'

describe "When I visit '/'" do
  describe "And I fill in 'Emily' in the textfield" do
    describe "And I click 'Get Poems'" do
      before :each do
        VCR.insert_cassette('emily_search')
      end
      after :each do
        VCR.eject_cassette('emily_search')
      end
      it "I should be on page '/search'" do
        visit '/'

        fill_in :author, with: 'Emily'

        click_on 'Get Poems'

        expect(current_path).to eq('/search')
      end
      it 'Then I should see a list of the first 10 poems' do
        visit '/'

        fill_in :author, with: 'Emily'

        click_on 'Get Poems'

        within '#not-at-home-to-callers' do
          expect(page).to have_content('Emily Dickinson')
          expect(page).to have_content('Not at Home to Callers Says the Naked Tree -- Bonnet due in April -- Wishing you Good Day --')
          expect(page).to have_content('Not at Home to Callers')
          expect(page).to have_content('Joy')
          expect(page).to have_content('0.730959')
        end
      end
    end
  end
end
