# Install Pandoc

## Overview
Pandoc is a universal document converter that enables exporting documentation to various formats (PDF, DOC, ODT, etc.). It's used by the `scripts/run_documentation.sh` script for document format conversion.

## What is Pandoc?
Pandoc can convert between numerous markup and document formats, including:
- Markdown → PDF, HTML, DOCX, ODT
- HTML → Markdown, PDF, DOCX
- LaTeX → PDF, HTML, DOCX
- And many more combinations

## Installation

### Linux

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install pandoc
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install pandoc
```

**Arch Linux:**
```bash
sudo pacman -S pandoc
```

**openSUSE:**
```bash
sudo zypper install pandoc
```

### macOS

**Using Homebrew:**
```bash
brew install pandoc
```

**Using MacPorts:**
```bash
sudo port install pandoc
```

### Windows

**Using Chocolatey:**
```bash
choco install pandoc
```

**Using Scoop:**
```bash
scoop install pandoc
```

**Using winget:**
```bash
winget install JohnMacFarlane.Pandoc
```

## Manual Installation (Alternative)

If package managers don't work:

1. **Download from GitHub:**
   - Visit [Pandoc Releases](https://github.com/jgm/pandoc/releases)
   - Download the appropriate installer for your OS

2. **Linux (using downloaded .deb/.rpm):**
   ```bash
   # For .deb files (Ubuntu/Debian)
   sudo dpkg -i pandoc-*.deb
   
   # For .rpm files (Fedora/RHEL)
   sudo rpm -i pandoc-*.rpm
   ```

3. **macOS (using .pkg installer):**
   - Double-click the downloaded .pkg file
   - Follow the installation wizard

4. **Windows (using .msi installer):**
   - Double-click the downloaded .msi file
   - Follow the installation wizard

## Verify Installation

Test Pandoc installation:
```bash
pandoc --version
```

You should see Pandoc version information and supported formats.

## Additional Dependencies for PDF Output

To generate PDF files, Pandoc requires a LaTeX engine:

### Install LaTeX

**Linux:**
```bash
# Ubuntu/Debian
sudo apt install texlive-latex-base texlive-latex-recommended

# For full LaTeX distribution
sudo apt install texlive-full

# Fedora/RHEL
sudo dnf install texlive-latex

# Arch Linux
sudo pacman -S texlive-core texlive-latexextra
```

**macOS:**
```bash
# Using Homebrew
brew install --cask mactex

# Or smaller distribution
brew install --cask basictex
```

**Windows:**
- Download and install [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
- Or use Chocolatey: `choco install miktex`

## Test Document Conversion

Create a test Markdown file `test.md`:
```markdown
# Test Document

This is a **test** document with:

- Bullet points
- *Italic text*
- `Code snippets`

## Section 2

Some more content here.
```

Test conversions:
```bash
# Convert to HTML
pandoc test.md -o test.html

# Convert to PDF (requires LaTeX)
pandoc test.md -o test.pdf

# Convert to DOCX
pandoc test.md -o test.docx

# Convert to ODT
pandoc test.md -o test.odt
```

## Usage in CyborgAI CLI

The `scripts/run_documentation.sh` script will use Pandoc to:
1. Convert Markdown documentation to various formats
2. Export generated documentation to PDF, DOC, ODT formats
3. Create distributable documentation packages

## Common Pandoc Commands

### Basic Conversions
```bash
# Markdown to PDF
pandoc input.md -o output.pdf

# HTML to DOCX
pandoc input.html -o output.docx

# Multiple inputs
pandoc chapter1.md chapter2.md -o book.pdf
```

### With Options
```bash
# PDF with table of contents
pandoc input.md -o output.pdf --toc

# Custom CSS for HTML
pandoc input.md -o output.html --css style.css

# Standalone HTML document
pandoc input.md -o output.html --standalone
```

### Advanced Features
```bash
# With bibliography
pandoc input.md --bibliography refs.bib -o output.pdf

# Custom template
pandoc input.md --template custom.latex -o output.pdf

# Specific LaTeX engine
pandoc input.md --pdf-engine=xelatex -o output.pdf
```

## Troubleshooting

### Pandoc Not Found
If you get "pandoc command not found":
1. Ensure Pandoc is installed using the methods above
2. Restart your terminal
3. Check if Pandoc is in your PATH

### PDF Generation Issues
If PDF generation fails:
1. Install LaTeX as described above
2. Try a different PDF engine: `--pdf-engine=xelatex`
3. Check for missing LaTeX packages

### Memory Issues
For large documents:
```bash
pandoc +RTS -M2G -RTS input.md -o output.pdf
```

### Unicode Issues
For documents with special characters:
```bash
pandoc input.md -o output.pdf --pdf-engine=xelatex
```

## Configuration

Create a Pandoc defaults file `~/.pandoc/defaults.yaml`:
```yaml
pdf-engine: xelatex
toc: true
number-sections: true
highlight-style: github
```

## Resources
- [Pandoc Official Website](https://pandoc.org/)
- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
- [Pandoc Templates](https://github.com/jgm/pandoc-templates)
- [Pandoc Filters](https://pandoc.org/filters.html)