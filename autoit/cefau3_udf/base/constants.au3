#include-once

; Drag operation for drag event.
Global Const	$DRAG_OPERATION_NONE = 0, _
				$DRAG_OPERATION_COPY = 1, _
				$DRAG_OPERATION_LINK = 2, _
				$DRAG_OPERATION_GENERIC = 4, _
				$DRAG_OPERATION_PRIVATE = 8, _
				$DRAG_OPERATION_MOVE = 16, _
				$DRAG_OPERATION_DELETE = 32, _
				$DRAG_OPERATION_EVERY = 0xffffffff
;////////////////////////////////////////////////////////////////////////////////////////////////

; Transition type for a request. Made up of one source value and 0 or more qualifiers.

;~   // Source is a link click or the JavaScript window.open function. This is
;~   // also the default value for requests like sub-resource loads that are not
;~   // navigations.
Global Const $TT_LINK = 0

;~   // Source is some other "explicit" navigation action such as creating a new
;~   // browser or using the LoadURL function. This is also the default value
;~   // for navigations where the actual type is unknown.
Global Const $TT_EXPLICIT = 1

;~   // Source is a subframe navigation. This is any content that is automatically
;~   // loaded in a non-toplevel frame. For example, if a page consists of several
;~   // frames containing ads, those ad URLs will have this transition type.
;~   // The user may not even realize the content in these pages is a separate
;~   // frame, so may not care about the URL.
Global Const $TT_AUTO_SUBFRAME = 3

;~   // Source is a subframe navigation explicitly requested by the user that will
;~   // generate new navigation entries in the back/forward list. These are
;~   // probably more important than frames that were automatically loaded in
;~   // the background because the user probably cares about the fact that this
;~   // link was loaded.
Global Const $TT_MANUAL_SUBFRAME = 4

;~   // Source is a form submission by the user. NOTE: In some situations
;~   // submitting a form does not result in this transition type. This can happen
;~   // if the form uses a script to submit the contents.
Global Const $TT_FORM_SUBMIT = 7

;~   // Source is a "reload" of the page via the Reload function or by re-visiting
;~   // the same URL. NOTE: This is distinct from the concept of whether a
;~   // particular load uses "reload semantics" (i.e. bypasses cached data).
Global Const $TT_RELOAD = 8

;~   // General mask defining the bits used for the source values.
Global Const $TT_SOURCE_MASK = 0xFF

;~   // Qualifiers.
;~   // Any of the core values above can be augmented by one or more qualifiers.
;~   // These qualifiers further define the transition.

;~   // Attempted to visit a URL but was blocked.
Global Const $TT_BLOCKED_FLAG = 0x00800000

;~   // Used the Forward or Back function to navigate among browsing history.
Global Const $TT_FORWARD_BACK_FLAG = 0x01000000

;~   // The beginning of a navigation chain.
Global Const $TT_CHAIN_START_FLAG = 0x10000000

;~   // The last transition in a redirect chain.
Global Const $TT_CHAIN_END_FLAG = 0x20000000

;~   // Redirects caused by JavaScript or a meta refresh tag on the page.
Global Const $TT_CLIENT_REDIRECT_FLAG = 0x40000000

;~   // Redirects sent from the server by HTTP headers.
Global Const $TT_SERVER_REDIRECT_FLAG = 0x80000000

;~   // Used to test whether a transition involves a redirect.
Global Const $TT_IS_REDIRECT_MASK = 0xC0000000

;~   // General mask defining the bits used for the qualifiers.
Global Const $TT_QUALIFIER_MASK = 0xFFFFFF00
;/////////////////////////////////////////////////////////////////////////////////////////////