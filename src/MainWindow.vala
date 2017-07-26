/*
* Copyright (c) 2017 Dane Henson (http://brainofdane.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*/

namespace Bible {
    public class MainWindow : Gtk.Window {

        private Gtk.SearchEntry search;
        private Gtk.HeaderBar header;
        private Gtk.Paned paned;
        private Gtk.ScrolledWindow scrolled;
        private Widgets.BookView book_view;
        private Widgets.ChapterView chapter_view;

        public MainWindow (Bible.Application application) {
            Object (application: application,
                    icon_name: "com.github.dahenson.bible",
                    title: _("Bible"),
                    height_request: 600,
                    width_request: 800);
        }

        construct {
            search = new Gtk.SearchEntry ();
            search.placeholder_text = "Search Bible";

            header = new Gtk.HeaderBar ();
            header.pack_end (search);
            header.show_close_button = true;
            set_titlebar (header);

            chapter_view = new Widgets.ChapterView ();
            book_view = new Widgets.BookView ();
            paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
            scrolled = new Gtk.ScrolledWindow (null, null);
            scrolled.add (book_view);
            paned.add1 (scrolled);
            paned.add2 (chapter_view);
            paned.position = 175;
            this.add (paned);

            book_view.row_activated.connect (on_book_view_row_activated);
            search.activate.connect (on_search_activated);

            chapter_view.passage_lookup ("Genesis 1");

            show_all ();
        }

        private void on_search_activated () {
            string search_text = search.get_text ();
            chapter_view.search (search_text);
        }

        private void on_book_view_row_activated (Gtk.TreePath path, Gtk.TreeViewColumn column) {
            bool is_header;
            string book;

            Gtk.TreeIter activated_iter;

            var book_store = book_view.get_model ();

            book_store.get_iter (out activated_iter, path);
            book_store.get (activated_iter,
                Widgets.BookView.Columns.IS_HEADER, out is_header,
                Widgets.BookView.Columns.BOOK, out book);

            if (is_header) {
                if (book_view.is_row_expanded (path)) {
                    book_view.collapse_row (path);
                } else{
                    book_view.expand_row (path, true);
                }
            } else {
                header.title = book + " 1";
                chapter_view.passage_lookup (book + " 1");
            }
        }
    }
}