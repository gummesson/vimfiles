" HTML5
syntax keyword cssTagName article aside audio bb canvas command datagrid
syntax keyword cssTagName datalist details dialog embed figure footer figcaption
syntax keyword cssTagName header hgroup keygen mark meter nav output 
syntax keyword cssTagName progress time rt rp section time video ruby summary object

" Media Queries
syntax region cssMediaType start="(" end=")" contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape nextgroup=cssMediaComma,cssMediaAnd,cssMediaBlock skipwhite skipnl
syntax match  cssMediaAnd "and" nextgroup=cssMediaType skipwhite skipnl
syntax clear  cssMediaBlock
syntax region cssMediaBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssTagName,cssSelectorOp,cssAttributeSelector,cssIdentifier,cssError,cssDefinition,cssPseudoClass,cssComment,cssUnicodeEscape,cssClassName,cssURL
