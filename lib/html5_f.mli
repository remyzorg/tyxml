(* TyXML
 * http://www.ocsigen.org/tyxml
 * Copyright (C) 2004 by Thorsten Ohl <ohl@physik.uni-wuerzburg.de>
 * Copyright (C) 2007 by Vincent Balat, Gabriel Kerneis
 * Copyright (C) 2010 by Cecile Herbelin
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA 02111-1307, USA.
*)

(** Typesafe constructors for HTML5 documents (Functorial interface) *)

module Make(Xml : Xml_sigs.T)(Svg : Svg_sigs.T with module Xml := Xml)
  : Html5_sigs.T with type Xml.uri = Xml.uri
                  and type Xml.event_handler = Xml.event_handler
                  and type Xml.attrib = Xml.attrib
                  and type Xml.elt = Xml.elt
                  and module Svg := Svg
                  and type +'a elt = Xml.elt
                  and type 'a Xml.wrap = 'a
                  and type 'a wrap = 'a
                  and type 'a attrib = Xml.attrib
                  and type uri = Xml.uri

(** Like the {! Html5_f.Make } functor, but allows to wrap elements inside a monad described by {! Xml_wrap.T}.
    See the functorial interface documentation for more details. *)
module MakeWrapped
    (W : Xml_wrap.T)
    (Xml : Xml_sigs.Wrapped with type 'a wrap = 'a W.t)
    (Svg : Svg_sigs.T with module Xml := Xml)
  : Html5_sigs.T with type Xml.uri = Xml.uri
                  and type Xml.event_handler = Xml.event_handler
                  and type Xml.attrib = Xml.attrib
                  and type Xml.elt = Xml.elt
                  and module Svg := Svg
                  and type +'a elt = Xml.elt
                  and type 'a Xml.wrap = 'a W.t
                  and type 'a wrap = 'a W.t
                  and type 'a attrib = Xml.attrib
                  and type uri = Xml.uri
