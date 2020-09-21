
class Gossip
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "a") do |csv| 
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.open("./db/gossip.csv", 'r') do |file|
      file.each do |x, y|
        all_gossips << [x, y]
      end
    end
    return all_gossips
  end

  # recuperer le resultat de self.all
  def self.find
    self.all
  end

  # recuperer les donnes dans le CSV sous forme de array
  # utiliser la method delete_at pour supprimer a l'index selectionner
  # utiliser la method insert pour inserer la nouvelle element a l'index selectionner 
  # reecrire le csv avec la nouvelle array
  def self.update(id, author, content)
    change = []
    CSV.open("./db/gossip.csv", 'r') do |file|
      file.each do |x, y|
        change << [x, y]
      end
    end
    #puts id
    
    change.delete_at(id)
    change.insert(id, [author, content])

    CSV.open("./db/gossip.csv", 'wb') do |file|
      change.each do |x, y|file << [x, y]
      end
    end
  end
end

