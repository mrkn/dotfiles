case node[:platform]
when 'darwin'
  include_module 'glib'
  include_module 'libsndfile'
  include_module 'portaudio'
  package 'fluid-synth' do
    options '--with-libsndfile --with-portaudio'
  end
end
