class InvalidCodonError < StandardError
  def self.message
    "Invalid strand, wrong nucleotides or wrong strand size"
  end
end

class Rna
  PROTEINS = {
    "Methionine" => ["AUG"],
    "Phenylalanine" => ["UUU", "UUC"],
    "Leucine" => ["UUA", "UUG"],
    "Serine" => ["UCU", "UCC", "UCA", "UCG"],
    "Tyrosine" => ["UAU", "UAC"],
    "Cysteine" => ["UGU", "UGC"],
    "Tryptophan" => ["UGG"],
    "STOP" => ["UAA", "UAG", "UGA"]
  }
  attr_accessor :strand, :codons, :proteins
  
  def initialize(strand)
    @strand = strand
    raise(InvalidCodonError, InvalidCodonError.message) unless valid_strand?
    @codons = [""]
    divide_strand
    @proteins = translate_protein
  end
  
  private
  
  def divide_strand
    @codons = [""]
    counter = 0
    @strand.each_char do |nucleotide|
      if @codons[counter].size == 3
        @codons << "#{nucleotide}"
        counter += 1
        break if stop_codon?
      else
        @codons[counter] << nucleotide
        break if stop_codon?
      end
    end
    @codons.slice!(-1) if stop_codon?
  end
  
  def stop_codon?
    PROTEINS["STOP"].include?(@codons.last)
  end
  
  def translate_protein
    protein = []
    @codons.each { |codon| protein << Translation.of_codon(codon) }
    protein
  end
  
  def valid_strand?
    valid_size? && valid_nucleotides? 
  end
  
  def valid_size?
    @strand.size % 3 == 0 
  end
  
  def valid_nucleotides?
    result = nil
    @strand.each_char { |nucleotide| result = %(A U G C).include?(nucleotide) }
    result
  end
end

class Translation < Rna
  def self.of_codon(codon)
    PROTEINS.select  { |_, codons_array| codons_array.include?(codon) }.keys.first  
  end
  
  def self.of_rna(strand)
    Translation.new(strand).proteins
  end
end