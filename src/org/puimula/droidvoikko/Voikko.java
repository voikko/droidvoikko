/*
 * The contents of this file are subject to the Mozilla Public License Version 
 * 1.1 (the "License"); you may not use this file except in compliance with 
 * the License. You may obtain a copy of the License at 
 * http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 * 
 * The Original Code is Libvoikko: Library of natural language processing tools.
 * The Initial Developer of the Original Code is Harri Pitkänen <hatapitk@iki.fi>.
 * Portions created by the Initial Developer are Copyright (C) 2012
 * the Initial Developer. All Rights Reserved.
 * 
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 */

package org.puimula.droidvoikko;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class Voikko {
	
	final long nativeHandle;
	
	public Voikko(String langCode, String path) {
		nativeHandle = init(langCode, path);
	}
	
	public boolean spell(String word) {
		if (word == null) {
			return true;
		}
		int spellResult = spell(nativeHandle, word);
		return spellResult != 0;
	}
	
	public List<String> suggestions(String word, int maxSuggestions) {
		if (word == null) {
			return Collections.emptyList();
		}
		long suggestionHandle = suggest(nativeHandle, word);
		if (suggestionHandle == 0) {
			return Collections.emptyList();
		}
		List<String> suggestionList = new ArrayList<String>();
		for (int i = 0; i < maxSuggestions; i++) {
			String suggestion = stringFromArray(suggestionHandle, i);
			if (suggestion == null) {
				break;
			}
			suggestionList.add(suggestion);
		}
		freeSuggestions(suggestionHandle);
		return suggestionList;
	}
	
	private native long init(String langCode, String path);
	
	private native int spell(long handle, String word);
	
	private native long suggest(long handle, String word);
	
	private native String stringFromArray(long array, int index);
	
	private native void freeSuggestions(long suggestions);
	
	static {
		System.loadLibrary("voikko-jni");
	}
}
