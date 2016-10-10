module BandsHelper
  def sorted_bands
    @bands.sort { |a,b| a.name.downcase <=> b.name.downcase }
  end
end
