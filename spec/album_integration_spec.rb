require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('crate an album path', {:type => :feature}) do
    it('creates an album and then goes to the album page') do
        visit('/albums')
        click_on('Add a new album')
        fill_in('album_name', :with => 'Graduation')
        click_on('Create!')
        expect(page).to have_content('Graduation')
    end
end

describe('create a song path', {:type => :feature}) do
    it('creates a song and then goes to the album page') do
        album = Album.new({:name => 'College Dropout', :id => nil})
        album.save
        visit("/albums/#{album.id}")
        fill_in('song_name', :with => 'Champion')
        click_on('Add song')
        expect(page).to have_content('Champion')
    end
end