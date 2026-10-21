# Homebrew tap fixture

Non-production destination for Releaseway integration tests. Its workflows come
from homebrew-tap-starter and call the public homebrew-actions interfaces.

Validation and deletion workflows pin `releaseway/homebrew-actions` by full
commit SHA. Read their `uses` references in [.github/workflows](.github/workflows)
for the installed dependency.

releaseway/release-fixture owns the product source, specs and orchestration.
Package registration and updates are performed by that product workflow.
This repository owns generated Formula state and shared tap validation only.

No production package or end user should depend on this repository.
