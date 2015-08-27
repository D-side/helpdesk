# Sample helpdesk application

## Design decisions

* Since ticket states can be changed arbitrarily by staff members and there is
  only one rule for guests, state machine is not used. Instead, there is
  a single "state" field on tickets.
* Access control is dead simple and not exactly extensible. However, due to
  mostly resourceful controllers, you can easily switch to CanCanCan or
  another per-action authorization solution.

## Things one might do for production-readiness:

* Email sending is slow. This project uses **unconfigured** ActiveJob, and
  sends emails **synchronously**. Configure ActiveJob to mitigate this.
