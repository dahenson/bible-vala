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

public class APIQuery : GLib.Object {

    string BASEURL = "http://www.esvapi.org/v2/rest";

    public string key { get; set; default = "IP"; }
    public string passage { get; set; }
    public string q { get; set; }
    public string output_format { get; set; default = ""; }
    public bool include_passage_references { get; set; default = true; }
    public bool include_verse_numbers { get; set; default = true; }
    public bool include_footnotes { get; set; default = true; }
    public bool include_footnote_links { get; set; default = true; }
    public bool include_headings { get; set; default = true; }
    public bool include_subheadings { get; set; default = true; }
    public bool include_surrounding_chapters { get; set; default = false; }
    public bool include_word_ids { get; set; default = true; }
    public bool include_audio_link { get; set; default = true; }
    public string audio_format { get; set; default = "mp3"; }
    public bool include_short_copyright { get; set; default = false; }
    public bool include_copyright { get; set; default = true; }

    public string passage_query (string query_string) {
        Soup.URI uri = new Soup.URI (BASEURL + "/passageQuery");
        uri.set_query_from_fields (
            "key", key,
            "passage", query_string,
            "include-passage-references", include_passage_references.to_string (),
            "include-verse-numbers", include_verse_numbers.to_string (),
            "include-footnotes", include_footnotes.to_string (),
            "include-footnote-links", include_footnote_links.to_string (),
            "include-headings", include_headings.to_string (),
            "include-subheadings", include_subheadings.to_string (),
            "include-surrounding-chapters", include_surrounding_chapters.to_string (),
            "include-word-ids", include_word_ids.to_string (),
            "include-audio-link", include_audio_link.to_string (),
            "include-short-copyright", include_short_copyright.to_string (),
            "include-copyright", include_copyright.to_string ());
        return uri.to_string (false);
    }

    public string query (string query_string) {
        Soup.URI uri = new Soup.URI (BASEURL + "/query");
        uri.set_query_from_fields (
            "key", key,
            "q", query_string,
            "include-passage-references", include_passage_references.to_string (),
            "include-verse-numbers", include_verse_numbers.to_string (),
            "include-footnotes", include_footnotes.to_string (),
            "include-footnote-links", include_footnote_links.to_string (),
            "include-headings", include_headings.to_string (),
            "include-subheadings", include_subheadings.to_string (),
            "include-surrounding-chapters", include_surrounding_chapters.to_string (),
            "include-word-ids", include_word_ids.to_string (),
            "include-audio-link", include_audio_link.to_string (),
            "include-short-copyright", include_short_copyright.to_string (),
            "include-copyright", include_copyright.to_string ());
        return uri.to_string (false);
    }
}