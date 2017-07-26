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

namespace BibleUtils {
    public const string ESVSTYLE = "
    :root {
        --h0: 4.5rem;
        --h1: 3rem;
        --h2: 2.25rem;
        --h3: 1.5rem;
        --h4: 1.125rem;
        --h5: .75rem;

        --lh: calc(4/3);
        --mx: 32em;

        --m1: calc(2/3 * 1em);
        --m2: calc(4/3 * 1em);
        --m3: calc(8/3 * 1em);
        --m4: calc(16/3 * 1em);
        --x1: .5rem;
        --x2: 1rem;
        --x3: 2rem;
        --x4: 4rem;
        --x5: 8rem;
        --x6: 16rem;
    }
    div.esv {
        color: #333;
        max-width: var(--mx);
        padding: 0em;
        font-size: var(--h4);
        line-height: var(--lh);
        margin: 2rem auto;
    }
    h1, h2, h3 {
        margin-top: var(--m1);
        margin-bottom: 0;
    }
    h4, h5, h6,
    p, dl, ol, ul, blockquote {
        margin-top: var(--m2);
        margin-bottom: var(--m2);
    }
    h1      { font-size: var(--h2) }
    h2, h3  { font-size: var(--h3) }
    h4      { font-size: var(--h4) }
    h5, h6  { font-size: var(--h5) }
    span.verse-num {
        font-size: 80%;
        font-weight: bold;
        padding-right: .15em;
        padding-left: .25em;
        vertical-align: text-top;
    }
    span.woc { /* Words of Christ (for red-letter editions) */
        /* color: #900;*/
    }
    span.chapter-num {
        font-weight: bold;
        padding-right: .5em;
    }
    div.esv-text p {
        text-indent: 2em;
    }
    div.esv-text p.same-paragraph {
        text-indent: 0;
    }
    div.block-indent p {
        text-indent: 0;
        padding-left: 2.5em;
        margin-left: 0;
    }
    span.indent {
        padding-left: 2em;
    }
    span.indent-2, span.psalm-doxology-line {
        padding-left: 4em;
    }
    span.declares-line {
        padding-left: 6em;
    }
    span.small-caps {
        font-variant: small-caps;
    }
    span.selah {
        font-style: italic;
        margin-left: 1em;
    }
    p.extra-space {
        margin-top: 2em;
    }
    div.block-indent span.verse-num, div.block-indent span.woc  {
        padding-left: 0;
    }
    h4 {
        font-weight: normal;
    }
    h4.speaker {
        padding-left: 10em;
        font-variant: small-caps;
        margin-bottom: -1em;
    }
    h4.textual-note {
        font-variant: small-caps;
    }
    h4.psalm-acrostic-title {
        font-variant: small-caps;
    }
    h4.psalm-title {

    }
    span.footnote {
        font-size: 80%;
        padding-right: .5em;
        padding-left: 0em;
        vertical-align: text-top;
    }
    div.footnotes h3 {
        margin-top: 0;
        margin-bottom: 0;
    }
    div.footnotes p {
        text-indent: 0;
    }
    span.footnote-ref {
        font-weight: bold;
    }
    p.copyright {
        text-indent: 0;
    }
    object.audio {
        margin: 0 0 0 10px;
        padding: 0;
    }";
}