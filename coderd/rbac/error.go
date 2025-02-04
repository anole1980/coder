package rbac

import "github.com/open-policy-agent/opa/rego"

const (
	// errUnauthorized is the error message that should be returned to
	// clients when an action is forbidden. It is intentionally vague to prevent
	// disclosing information that a client should not have access to.
	errUnauthorized = "forbidden"
)

// UnauthorizedError is the error type for authorization errors
type UnauthorizedError struct {
	// internal is the internal error that should never be shown to the client.
	// It is only for debugging purposes.
	internal error

	// These fields are for debugging purposes.
	subject Subject
	action  Action
	// Note only the object type is set for partial execution.
	object Object

	output rego.ResultSet
}

// ForbiddenWithInternal creates a new error that will return a simple
// "forbidden" to the client, logging internally the more detailed message
// provided.
func ForbiddenWithInternal(internal error, subject Subject, action Action, object Object, output rego.ResultSet) *UnauthorizedError {
	return &UnauthorizedError{
		internal: internal,
		subject:  subject,
		action:   action,
		object:   object,
		output:   output,
	}
}

// Error implements the error interface.
func (UnauthorizedError) Error() string {
	return errUnauthorized
}

// Internal allows the internal error message to be logged.
func (e *UnauthorizedError) Internal() error {
	return e.internal
}

func (e *UnauthorizedError) Input() map[string]interface{} {
	return map[string]interface{}{
		"subject": e.subject,
		"action":  e.action,
		"object":  e.object,
	}
}

// Output contains the results of the Rego query for debugging.
func (e *UnauthorizedError) Output() rego.ResultSet {
	return e.output
}
