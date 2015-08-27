# Sample helpdesk application

## Things one might do for production-readiness:

* Email sending is slow. This project uses **unconfigured** ActiveJob, and
  sends emails **synchronously**. Configure ActiveJob to mitigate this.
