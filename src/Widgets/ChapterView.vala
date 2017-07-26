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
    public class ChapterView : Gtk.Grid {

        public WebKit.WebView web_view;
        public APIQuery api_query;

        public ChapterView () {
            Object (
                expand: true);
        }

        construct {
            var stylesheet = load_css_from_resource ("com/github/dahenson/bible/ChapterView.css");
            var user_style = new WebKit.UserStyleSheet (
                stylesheet,
                WebKit.UserContentInjectedFrames.ALL_FRAMES,
                WebKit.UserStyleLevel.USER,
                null,
                null);

            var content_manager = new WebKit.UserContentManager ();
            content_manager.add_style_sheet (user_style);

            api_query = new APIQuery ();
            api_query.include_audio_link = false;
            api_query.key = "TEST";

            web_view = new WebKit.WebView.with_user_content_manager (content_manager);
            web_view.expand = true;

            this.add (web_view);
        }

        public void search (string search_text) {
            web_view.load_uri (api_query.query (search_text));
        }

        public void passage_lookup (string passage) {
            web_view.load_uri (api_query.passage_query (passage));
        }

        private string load_css_from_resource (string path) {
            File file;
            uint8[] stylesheet;
            string etag_out;

            file = File.new_for_uri ("resource://" + path);
            try {
                file.load_contents (null, out stylesheet, out etag_out);
            } catch (Error e) {
                stdout.printf ("Error: %s\n", e.message);
            }

            return (string) stylesheet;
        }
    }
}