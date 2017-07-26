project('com.github.dahenson.bible', ['vala', 'c'],
    version: '0.1.0'
)

gnome = import('gnome')
i18n = import('i18n')

asresources = gnome.compile_resources(
    'as-resources', 'data/css.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')], language: 'vala')

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
configure_file(output: 'config.h', configuration:conf)
config_h_dir = include_directories('.')

c_args = [
    '-include', 'config.h',
]

executable(
    'com.github.dahenson.bible',
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Utils/APIQuery.vala',
    'src/Utils/BibleUtils.vala',
    'src/Widgets/BookView.vala',
    'src/Widgets/ChapterView.vala',
    asresources,
    c_args : c_args,
    dependencies: [
        dependency('glib-2.0'),
        dependency('gobject-2.0'),
        dependency('gtk+-3.0'),
        dependency('webkit2gtk-4.0'),
        dependency('libsoup-2.4'),
        dependency('granite'),
        dependency('gee-0.8')
    ],
    install : true
)

meson.add_install_script('meson/post_install.py')

subdir('data')