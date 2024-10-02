# createtf
---

## Terraform Project Bootstrapper

**Terraform Project Bootstrapper** is a lightweight shell script that automates the setup of a well-structured Terraform project. This tool creates the essential files and folders required for any Terraform configuration, following best practices while allowing for quick customization and scalability.

### Features:
- **Automatic Project Structure**: Quickly generates a Terraform project with core files like `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`, `terraform.tfvars`, and more.
- **Templated Backend Configuration**: Dynamically inserts the provided folder name into the `backend` key of the Terraform state, perfect for projects using S3 for state management.
- **Customizable Variables and Outputs**: Creates commented-out examples for variables, outputs, and environment-specific values to make it easy to start customizing your configuration.
- **No External Dependencies**: Just run the shell script, and it will generate a project with all necessary files in place.
- **Designed for Simplicity and Best Practices**: Provides a clean, maintainable structure ideal for both beginners and experienced Terraform users.

### Usage:
1. Download or clone the repository.
2. Run the script, passing in the folder name for your Terraform project:
   ```bash
   ./create_terraform_project.sh <your-folder-name>
   ```
3. Start building your infrastructure by adding your Terraform resources to `main.tf` and customizing the other files as needed.

### Ideal For:
- Users who want a quick start with Terraform and prefer to follow best practices.
- Developers and DevOps engineers who need a clean project structure for Terraform.
- Teams looking to standardize their Terraform setup across different environments.

---
