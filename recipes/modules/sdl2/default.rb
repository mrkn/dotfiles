case node[:platform]
when 'darwin'
  package 'sdl2'

  package 'sdl2_gfx'

  include_module 'libjpeg'
  include_module 'libpng'
  include_module 'libtiff'
  include_module 'libwebp'
  package 'sdl2_image' do
    options '--with-jpeg --with-libpng --with-libtiff --with-webp'
  end

  include_module 'flac'
  include_module 'fluid-synth'
  include_module 'smpeg2'
  include_module 'libmikmod'
  include_module 'libmodplug'
  include_module 'libvorbis'
  package 'sdl2_mixer' do
    options '--with-flac --with-fluid-synth --with-libmikmod --with-libmodplug --with-libvorbis --with-smpeg2'
  end

  package 'sdl2_net'

  include_module 'freetype'
  package 'sdl2_ttf'
end
