#include "../cefau3.h"

#include "include/capi/cef_dom_capi.h"

/* CefDOMVisitor
--------------------------------------------------*/

CEFAU3API void CefDOMVisitor_Visit(struct _cef_domvisitor_t* self,
	struct _cef_domdocument_t* document)
{
	self->visit(self, document);
}

/* CefDOMDocument
--------------------------------------------------*/

CEFAU3API cef_dom_document_type_t CefDOMDocument_GetType(
	struct _cef_domdocument_t* self)
{
	return self->get_type(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMDocument_GetDocument(
	struct _cef_domdocument_t* self)
{
	return self->get_document(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMDocument_GetBody(
	struct _cef_domdocument_t* self)
{
	return self->get_body(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMDocument_GetHead(
	struct _cef_domdocument_t* self)
{
	return self->get_head(self);
}

CEFAU3API const wchar_t* CefDOMDocument_GetTitle(
	struct _cef_domdocument_t* self)
{
	return self->get_title(self)->str;
}

CEFAU3API struct _cef_domnode_t* CefDOMDocument_GetElementById(
	struct _cef_domdocument_t* self,
	const wchar_t* id)
{
	return self->get_element_by_id(self, cefstring_pwcs(id));
}

CEFAU3API struct _cef_domnode_t* CefDOMDocument_GetFocusedNode(
	struct _cef_domdocument_t* self)
{
	return self->get_focused_node(self);
}

CEFAU3API int CefDOMDocument_HasSelection(struct _cef_domdocument_t* self)
{
	return self->has_selection(self);
}

CEFAU3API int CefDOMDocument_GetSelectionStartOffset(
	struct _cef_domdocument_t* self)
{
	return self->get_selection_start_offset(self);
}

CEFAU3API int CefDOMDocument_GetSelectionEndOffset(struct _cef_domdocument_t* self)
{
	return self->get_selection_end_offset(self);
}

CEFAU3API const wchar_t* CefDOMDocument_GetSelectionAsMarkup(
	struct _cef_domdocument_t* self)
{
	return self->get_selection_as_markup(self)->str;
}

CEFAU3API const wchar_t* CefDOMDocument_GetSelectionAsText(
	struct _cef_domdocument_t* self)
{
	return self->get_selection_as_text(self)->str;
}

CEFAU3API const wchar_t* CefDOMDocument_GetBaseUrl(
	struct _cef_domdocument_t* self)
{
	return self->get_base_url(self)->str;
}

CEFAU3API const wchar_t* CefDOMDocument_GetCompleteUrl(
	struct _cef_domdocument_t* self,
	const wchar_t* partialURL)
{
	return self->get_complete_url(self, cefstring_pwcs(partialURL))->str;
}

/* CefDOMNode
--------------------------------------------------*/

CEFAU3API cef_dom_node_type_t CefDOMNode_GetType(struct _cef_domnode_t* self)
{
	return self->get_type(self);
}

CEFAU3API int CefDOMNode_IsText(struct _cef_domnode_t* self)
{
	return self->is_text(self);
}

CEFAU3API int CefDOMNode_IsElement(struct _cef_domnode_t* self)
{
	return self->is_element(self);
}

CEFAU3API int CefDOMNode_IsEditable(struct _cef_domnode_t* self)
{
	return self->is_editable(self);
}

CEFAU3API int CefDOMNode_IsFormControlElement(struct _cef_domnode_t* self)
{
	return self->is_form_control_element(self);
}

CEFAU3API const wchar_t* CefDOMNode_GetFormControlElementType(
	struct _cef_domnode_t* self)
{
	return self->get_form_control_element_type(self)->str;
}

CEFAU3API int CefDOMNode_IsSame(struct _cef_domnode_t* self,
	struct _cef_domnode_t* that)
{
	return self->is_same(self, that);
}

CEFAU3API const wchar_t* CefDOMNodeget_name(struct _cef_domnode_t* self)
{
	return self->get_name(self)->str;
}

CEFAU3API const wchar_t* CefDOMNode_GetValue(struct _cef_domnode_t* self)
{
	return self->get_value(self)->str;
}

CEFAU3API int CefDOMNode_SetValue(struct _cef_domnode_t* self,
	const wchar_t* value)
{
	return self->set_value(self, cefstring_pwcs(value));
}

CEFAU3API const wchar_t* CefDOMNode_GetAsMarkup(
	struct _cef_domnode_t* self)
{
	return self->get_as_markup(self)->str;
}

CEFAU3API struct _cef_domdocument_t* CefDOMNode_GetDocument(
	struct _cef_domnode_t* self)
{
	return self->get_document(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMNode_GetParent(struct _cef_domnode_t* self)
{
	return self->get_parent(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMNode_GetPreviousSibling(
	struct _cef_domnode_t* self)
{
	return self->get_previous_sibling(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMNode_GetNextSibling(
	struct _cef_domnode_t* self)
{
	return self->get_next_sibling(self);
}

CEFAU3API int CefDOMNode_HasChildren(struct _cef_domnode_t* self)
{
	return self->has_children(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMNode_GetFirstChild(
	struct _cef_domnode_t* self)
{
	return self->get_first_child(self);
}

CEFAU3API struct _cef_domnode_t* CefDOMNode_GetLastChild(
	struct _cef_domnode_t* self)
{
	return self->get_last_child(self);
}

CEFAU3API const wchar_t* CefDOMNode_GetElementTagName(
	struct _cef_domnode_t* self)
{
	return self->get_element_tag_name(self)->str;
}

CEFAU3API int CefDOMNode_HasElementAttributes(struct _cef_domnode_t* self)
{
	return self->has_element_attributes(self);
}

CEFAU3API int CefDOMNode_HasElementAttribute(struct _cef_domnode_t* self,
	const wchar_t* attrName)
{
	return self->has_element_attribute(self, cefstring_pwcs(attrName));
}

CEFAU3API const wchar_t* CefDOMNode_GetElementAttribute(
	struct _cef_domnode_t* self,
	const wchar_t* attrName)
{
	return self->get_element_attribute(self, cefstring_pwcs(attrName))->str;
}

CEFAU3API void CefDOMNode_GetElementAttributes(struct _cef_domnode_t* self,
	cef_string_map_t attrMap)
{
	self->get_element_attributes(self, attrMap);
}

CEFAU3API int CefDOMNode_SetElementAttribute(struct _cef_domnode_t* self,
	const wchar_t* attrName,
	const wchar_t* value)
{
	return self->set_element_attribute(
		self,
		cefstring_pwcs(attrName),
		cefstring_pwcs(value)
	);
}

CEFAU3API const wchar_t* CefDOMNode_GetElementInnerText(
	struct _cef_domnode_t* self)
{
	return self->get_element_inner_text(self)->str;
}

CEFAU3API cef_rect_t CefDOMNode_GetElementBounds(struct _cef_domnode_t* self)
{
	return self->get_element_bounds(self);
}