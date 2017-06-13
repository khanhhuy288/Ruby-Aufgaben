class POI

  attr_reader :geo_coord, :attachments, :name
  protected :attachments
  def initialize(name, geo_coord)
    @name = name
    @geo_coord = geo_coord
    @attachments = []
  end

  def <<(attachment)
    unless attachment.is_a?(Attachment)
      return self
    end
    unless @attachments.include?(attachment)
      @attachments << attachment
    end
    self
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@name,@geo_coord,@attachments] == [other.name,other.geo_coord,other.attachments]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@name,@geo_coord,@attachments].eql?([other.name,other.geo_coord,other.attachments])
  end

  def hash
    @name.hash + @geo_coord.hash + @attachments.hash
  end

  def to_s
    "POI(#{@name},#{@geo_coord},\{#{@attachments.sort.join(',')}\}"
  end

end

class Geokoordinate
  attr_reader :bg, :lg
  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@bg,@lg] == [other.bg,other.lg]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@bg,@lg].eql?([other.bg,other.lg])
  end

  def hash
    @bg.hash + @lg.hash
  end

  def to_s
    "(#{@bg},#{@lg})"
  end

end

class Attachment
  attr_reader :name,:inhalt
  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@name, @inhalt] == [other.name,other.inhalt]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@name, @inhalt].eql?([other.name,other.inhalt])
  end

  def hash
    @name.hash + @inhalt.hash
  end

  def to_s
    "At[#{@name},#{@inhalt}]"
  end

end

#my_geo = Geokoordinate.new(56.34, 23.89);
#your_geo = Geokoordinate.new(56.34, 23.89);
#atach1 = Attachment.new("CollosVideo","prp1://video:videocollos1")
#atach2 = Attachment.new("CollosVideo2","prp2://video:videocollos2")
#list_atach1 = [] << atach1 << atach2
#list_atach2 = [] << atach2 << atach1
#print list_atach1 == list_atach2

