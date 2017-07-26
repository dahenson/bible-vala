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
*
*/

namespace Bible.Widgets {
    public class BookView : Gtk.TreeView {
        public Gtk.TreeStore book_store;

        public enum Columns {
            ICON,
            BOOK,
            CHAPTERS,
            IS_HEADER,
            N_COLUMNS
        }

        public BookView () {
            Object (
                headers_visible: false,
                activate_on_single_click: true,
                show_expanders: true
            );
        }

        construct {
            book_store = new Gtk.TreeStore (
                Columns.N_COLUMNS,
                typeof(string?),
                typeof(string),
                typeof(int),
                typeof(bool));

            Gtk.CellRendererPixbuf book_icon = new Gtk.CellRendererPixbuf ();
            Gtk.TreeViewColumn text_column = new Gtk.TreeViewColumn ();
            text_column.expand = true;
            text_column.title = "Icon";
            text_column.pack_start (book_icon, false);
            text_column.add_attribute (book_icon, "icon_name", Columns.ICON);
            text_column.set_cell_data_func(book_icon, icon_renderer_function);
            Gtk.CellRendererText text_renderer = new Gtk.CellRendererText();
            text_renderer.ellipsize = Pango.EllipsizeMode.END;
            text_column.pack_start(text_renderer, true);
            text_column.add_attribute(text_renderer, "markup", Columns.BOOK);
            this.append_column (text_column);

            this.set_model (book_store);

            populate_books ();

            this.expand_all ();

        }

        public void icon_renderer_function(Gtk.CellLayout layout, Gtk.CellRenderer renderer, Gtk.TreeModel model, Gtk.TreeIter iter) {
            Value val;
            book_store.get_value (iter, Columns.IS_HEADER, out val);
            renderer.visible = !val.get_boolean ();
        }

        private void populate_books () {
            Gtk.TreeIter root;

            book_store.append (out root, null);
            book_store.set (root,
                Columns.BOOK, "<b>Old Testament</b>",
                Columns.IS_HEADER, true,
                -1);
            this.add_book (root, "Genesis", 50);
            this.add_book (root, "Exodus", 40);
            this.add_book (root, "Leviticus", 27);
            this.add_book (root, "Numbers", 36);
            this.add_book (root, "Deuteronomy", 34);
            this.add_book (root, "Joshua", 24);
            this.add_book (root, "Judges", 21);
            this.add_book (root, "Ruth", 4);
            this.add_book (root, "1 Samuel", 31);
            this.add_book (root, "2 Samuel", 24);
            this.add_book (root, "1 Chronicles", 29);
            this.add_book (root, "2 Chronicles", 36);
            this.add_book (root, "Ezra", 10);
            this.add_book (root, "Nehemiah", 13);
            this.add_book (root, "Esther", 10);
            this.add_book (root, "Job", 42);
            this.add_book (root, "Psalms", 150);
            this.add_book (root, "Proverbs", 31);
            this.add_book (root, "Ecclesiastes", 12);
            this.add_book (root, "Song of Solomon", 8);
            this.add_book (root, "Isaiah", 66);
            this.add_book (root, "Jeremiah", 52);
            this.add_book (root, "Lamentations", 5);
            this.add_book (root, "Ezekiel", 48);
            this.add_book (root, "Daniel", 12);
            this.add_book (root, "Hosea", 14);
            this.add_book (root, "Joel", 3);
            this.add_book (root, "Amos", 9);
            this.add_book (root, "Obadiah", 1);
            this.add_book (root, "Jonah", 4);
            this.add_book (root, "Micah", 7);
            this.add_book (root, "Nahum", 3);
            this.add_book (root, "Habakkuk", 3);
            this.add_book (root, "Zephaniah", 3);
            this.add_book (root, "Haggai", 2);
            this.add_book (root, "Zechariah", 14);
            this.add_book (root, "Malachi", 4);

            book_store.append (out root, null);
            book_store.set (root,
                Columns.BOOK, "<b>New Testament</b>",
                Columns.IS_HEADER, true,
                -1);
            this.add_book (root, "Matthew", 28);
            this.add_book (root, "Mark", 16);
            this.add_book (root, "Luke", 24);
            this.add_book (root, "John", 21);
            this.add_book (root, "Acts", 28);
            this.add_book (root, "Romans", 16);
            this.add_book (root, "1 Corinthians", 16);
            this.add_book (root, "2 Corinthians", 13);
            this.add_book (root, "Galatians", 6);
            this.add_book (root, "Ephesians", 6);
            this.add_book (root, "Philippians", 4);
            this.add_book (root, "Colossians", 4);
            this.add_book (root, "1 Thessalonians", 4);
            this.add_book (root, "2 Thessalonians", 3);
            this.add_book (root, "1 Timothy", 6);
            this.add_book (root, "2 Timothy", 4);
            this.add_book (root, "Titus", 3);
            this.add_book (root, "Philemon", 1);
            this.add_book (root, "Hebrews", 13);
            this.add_book (root, "James", 5);
            this.add_book (root, "1 Peter", 5);
            this.add_book (root, "2 Peter", 3);
            this.add_book (root, "1 John", 5);
            this.add_book (root, "2 John", 1);
            this.add_book (root, "3 John", 1);
            this.add_book (root, "Jude", 1);
            this.add_book (root, "Revelation", 22);
        }

        private void add_book (Gtk.TreeIter root_iter, string book_name, int chapters) {
            Gtk.TreeIter book_iter;
            book_store.append (out book_iter, root_iter);
            book_store.set (book_iter,
                Columns.ICON, "library-audiobook",
                Columns.BOOK, book_name,
                Columns.CHAPTERS, chapters,
                Columns.IS_HEADER, false,
                -1);
        }
    }
}