require('rspec')
require('album')
require 'song'

describe '#Album' do
    before(:each) do
        Album.clear()
    end

    describe('.all') do
        it("returns an empty array when there are no albums") do
            expect(Album.all).to(eq([]))
        end
    end

    describe("#save") do
        it("saves an album") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album2 = Album.new({:name => "Late Registration", :id => nil})
            album2.save()
            expect(Album.all).to(eq([album, album2]))
        end
    end

    describe("#==") do
        it("is the same album if it has the same attributes as another album") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album2 = Album.new({:name => "College Dropout", :id => nil})
            album2.save()
            expect(album).to(eq(album2))
        end
    end

    describe(".clear") do
        it("clears all albums") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album2 = Album.new({:name => "Late Registration", :id => nil})
            album2.save()
            Album.clear()
            expect(Album.all).to(eq([]))
        end
    end

    describe('.find') do
        it("finds an album by id") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album2 = Album.new({:name => "Late Registration", :id => nil})
            album2.save()
            expect(Album.find(album.id)).to(eq(album))
        end
    end

    describe('#update') do
        it("updates an album by id") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album.update("Graduation")
            expect(album.name).to(eq("Graduation"))
        end
    end

    describe("#delete") do
        it("deletes an album by id") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            album2 = Album.new({:name => "Late Registration", :id => nil})
            album2.save()
            album.delete()
            expect(Album.all).to(eq([album2]))
        end
    end

    describe('#songs') do
        it("returns an album's songs") do
            album = Album.new({:name => "College Dropout", :id => nil})
            album.save()
            song = Song.new({:name => "All Falls Down", :album_id => album.id, :id => nil})
            song.save()
            song2 = Song.new({:name => "Last Call", :album_id => album.id, :id => nil})
            song2.save()
            expect(album.songs).to(eq([song, song2]))
        end
    end

    describe("#name") do
        it("returns the name of an album") do
            album = Album.new({:name => "College Dropout", :id => nil})
            expect(album.name).to(eq("College Dropout"))
        end
    end
end