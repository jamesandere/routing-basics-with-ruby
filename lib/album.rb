class Album
    attr_reader :name, :id

    @@albums = {}

    @@total_rows = 0

    def initialize(name, id)
        @name = name
        @id = id || @@total_rows += 1
    end

    def self.all
        @@albums.values()
    end

    def save
        @@albums[self.id] = Album.new(self.name, self.id)
    end

    def ==(other_album)
        self.name() == other_album.name()
    end

    def self.find(id)
        @@albums[id]
    end

    def self.clear
        @@albums = {}
        @@total_rows = 0
    end

    def update(name)
        @name = name 
    end

    def delete
        @@albums.delete(self.id)
    end
end