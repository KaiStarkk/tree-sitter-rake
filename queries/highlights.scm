; Rake 0.2.0 Syntax Highlighting
; Tree-sitter highlight queries

; Comments
(comment) @comment

; Keywords
[
  "stack"
  "single"
  "type"
  "crunch"
  "rake"
  "run"
  "let"
  "fun"
  "in"
  "through"
  "sweep"
  "else"
] @keyword

; lanes is a named rule, highlight it specially
(lanes) @constant.builtin

; Control flow
[
  "through"
  "sweep"
  "else"
] @keyword.control

; Operators
[
  "->"
  "<-"
  ":="
  "|>"
  "~>"
  "><"
  "+"
  "-"
  "*"
  "/"
  "%"
  "<"
  "<="
  ">"
  ">="
  "="
  "!="
  "!"
  "&&"
  "||"
  "and"
  "or"
  "not"
  "is"
] @operator

; Reduction/scan operators (distinctive styling)
(reduce_op) @operator.special
(scan_op) @operator.special

; Types
(primitive_type) @type.builtin
(compound_type) @type.builtin
(mask_type) @type.builtin
(type_identifier) @type

; Tines - the distinctive Rake feature
(tine_ref) @variable.parameter.tine
(tine_decl
  (tine_ref) @variable.definition.tine)

; Scalars/broadcasts - angle bracket syntax <...>
(scalar_expression) @variable.scalar

; Functions
(crunch_def
  name: (identifier) @function.definition)
(rake_def
  name: (identifier) @function.definition)
(run_def
  name: (identifier) @function.definition)
(call_expression
  function: (identifier) @function.call)

; Parameters
(rack_param
  (identifier) @variable.parameter)
(scalar_param
  (scalar_expression) @variable.parameter.scalar)

; Fields
(field_def
  name: (identifier) @property)
(field_expression
  (identifier) @property)
(field_init
  (identifier) @property)

; Variables
(let_statement
  name: (identifier) @variable.definition)
(assign_statement
  (identifier) @variable)
(identifier) @variable

; Literals
(integer_literal) @number
(float_literal) @number.float
(boolean_literal) @constant.builtin.boolean

; Special
(lane_index) @constant.builtin

; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  ","
  ":"
  "|"
] @punctuation.delimiter

; Records
(record_expression
  (type_identifier) @type.constructor)
