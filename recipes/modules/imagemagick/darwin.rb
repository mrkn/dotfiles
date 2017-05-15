include_module 'libtool'
include_module 'xz'

include_module 'libjpeg'
include_module 'libpng'
include_module 'libtiff'
include_module 'freetype'
include_module 'fontconfig'
include_module 'little-cms'
include_module 'little-cms2'
include_module 'libwmf'
include_module 'librsvg'
include_module 'liblqr'
include_module 'openexr'
include_module 'ghostscript'
include_module 'libwebp'
include_module 'openjpeg'
include_module 'fftw'
include_module 'pango'

package 'imagemagick' do
  options %w[
    --with-fftw
    --with-fontconfig
    --with-ghostscript
    --with-hdri
    --with-liblqr
    --with-librsvg
    --with-libwmf
    --with-little-cms
    --with-little-cms2
    --with-opencl
    --with-openexr
    --with-openjpeg
    --with-openmp
    --with-pango
    --with-perl
    --with-quantum-depth-16
    --with-quantum-depth-32
    --with-quantum-depth-8
    --with-webp
    --without-x11
    --with-zero-configuration
    --with-freetype
    --with-jpeg
    --with-libpng
    --with-libtiff
  ].join(' ')
end

package 'imagemagick@6' do
  #options %w[
  #  --with-fftw
  #  --with-fontconfig
  #  --with-ghostscript
  #  --with-hdri
  #  --with-liblqr
  #  --with-librsvg
  #  --with-libwmf
  #  --with-little-cms
  #  --with-little-cms2
  #  --with-opencl
  #  --with-openexr
  #  --with-openjpeg
  #  --with-pango
  #  --with-perl
  #  --with-quantum-depth-16
  #  --with-quantum-depth-32
  #  --with-quantum-depth-8
  #  --with-webp
  #  --with-zero-configuration
  #  --without-freetype
  #  --without-jpeg
  #  --without-libpng
  #  --without-libtiff
  #].join(' ')
end
