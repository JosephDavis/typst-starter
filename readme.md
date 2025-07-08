# Typst Starter

## Local Setup

### Rust and Typst Installation

1. [Install Rust](https://www.rust-lang.org/tools/install)
    - `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
        - Downloads and runs the Rust installation script.
2. `cargo install --locked typst-cli`
    - Installs the Typst command-line tool using Cargo (Rust's package manager).
3. `typst --version`


### `compile.sh`

This script automates the compilation of Typst documents within your project. It offers two modes of operation:

**Usage:**

1. **Compile All Documents:** This command will recursively search the `docs/` directory for all `.typ` files and compile them into corresponding PDFs in the `out/` directory.  The output directory structure will mirror the `docs/` directory.

```bash
./compile.sh
```

2. **Compile a Single Document:** Provide the path to a specific `.typ` file you want to compile. The script will generate the PDF in the `out/` directory, maintaining the relative path.

```bash
./compile.sh <path/to/file.typ>
```

**Example:**
```bash
./compile.sh docs/papers/my_paper.typ
```
This would compile `my_paper.typ` and place the resulting PDF at `out/papers/my_paper.pdf`.
