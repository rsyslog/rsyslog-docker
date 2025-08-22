# ⚠️ IMPORTANT: Documentation Has Moved\! ⚠️

-----

**This repository's content has been fully integrated into the main `rsyslog/rsyslog` project.**

All rsyslog documentation is now located in the `packaging/docler/` subdirectory of the main repository.

-----

### **➡️ Find the docker support here: [https://github.com/rsyslog/rsyslog](https://github.com/rsyslog/rsyslog)**

-----

## Why the Change?

This repository (`rsyslog-docker`) previously held the official docker definitions. We've merged it into the primary `rsyslog` codebase to greatly simplify maintenance, boost discoverability for users and tools, and streamline our development processes.

This move brings several key benefits:

  * **Simplified Maintenance:** You can now make docker def changes alongside code changes in a single pull request, ensuring everything stays in sync.
  * **Improved Discoverability:** The docker files are now right where most users look first – within the main project repository.
  * **Streamlined CI/CD:** Integrating the docker files simplifies our continuous integration and deployment pipelines.
  * **Better Cross-Referencing:** It's much easier to link directly between code and its relevant docker files.

## What Happened to This Repository?

This `rsyslog-docker` repository will remain as an **archive only**. No new documentation updates will be made here. All future docker contributions and updates should **exclusively target the `packaging/docker/` directory in the main `rsyslog/rsyslog` repository.**

