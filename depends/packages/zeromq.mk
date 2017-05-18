package=zeromq
$(package)_version=4.2.0
$(package)_download_path=https://github.com/zeromq/libzmq/releases/download/v4.2.0/
$(package)_file_name=zeromq-4.2.0.tar.gz
$(package)_sha256_hash=53b83bf0ee978931f76fa9cb46ad4affea65787264a5f3d140bc743412d0c117

define $(package)_set_vars
  $(package)_config_opts=--without-documentation --disable-shared --without-libsodium --disable-curve
  $(package)_config_opts_linux=--with-pic
  $(package)_cxxflags=-std=c++11
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install-libLTLIBRARIES install-includeHEADERS install-pkgconfigDATA
endef

define $(package)_postprocess_cmds
  rm -rf bin share
endef
