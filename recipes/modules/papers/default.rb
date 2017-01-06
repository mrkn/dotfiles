case node[:platform]
when 'darwin'
  install_app 'Papers' do
    version '3.4.7'
    url 'http://papersapp.com/download/mac'
    sha256 'a3772fad2fc4c5c273b597e136d7ba07e9f19c88b401d481f760697beb70ebe4'
    archive_name 'papers.dmg'
  end
end
