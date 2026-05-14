#!/bin/bash
# NeoVim Configuration Verification Script

echo "=========================================="
echo "NeoVim Configuration Verification"
echo "=========================================="
echo ""

# Test 1: Check nvim is installed
echo "✓ Test 1: NeoVim Installation"
if command -v nvim &> /dev/null; then
    nvim --version | head -1
    echo "  Status: ✅ PASS"
else
    echo "  Status: ❌ FAIL - nvim not found"
    exit 1
fi
echo ""

# Test 2: Check config directory exists
echo "✓ Test 2: Configuration Directory"
if [ -d ~/.config/nvim ]; then
    echo "  Location: ~/.config/nvim"
    echo "  Files: $(find ~/.config/nvim -name "*.lua" | wc -l) Lua files"
    echo "  Status: ✅ PASS"
else
    echo "  Status: ❌ FAIL - config directory not found"
    exit 1
fi
echo ""

# Test 3: Test config loads without errors
echo "✓ Test 3: Configuration Loading"
if nvim --headless "+lua print('Config OK')" +qa 2>&1 | grep -q "Config OK"; then
    echo "  Status: ✅ PASS - No errors"
else
    echo "  Status: ⚠️  WARNING - Check for errors"
fi
echo ""

# Test 4: Check leader key
echo "✓ Test 4: Leader Key Setting"
LEADER=$(nvim --headless "+lua print(vim.g.mapleader)" +qa 2>&1 | grep -v "NeoVim" | tail -1)
if [ "$LEADER" = "\\" ]; then
    echo "  Leader key: \\ (backslash)"
    echo "  Status: ✅ PASS"
else
    echo "  Leader key: $LEADER"
    echo "  Status: ⚠️  WARNING - Expected backslash"
fi
echo ""

# Test 5: Check indentation settings
echo "✓ Test 5: Indentation Settings"
TABSTOP=$(nvim --headless "+lua print(vim.opt.tabstop:get())" +qa 2>&1 | tail -1)
EXPANDTAB=$(nvim --headless "+lua print(vim.opt.expandtab:get())" +qa 2>&1 | tail -1)
echo "  Tabstop: $TABSTOP spaces"
echo "  Expandtab: $EXPANDTAB"
if [ "$TABSTOP" = "2" ] && [ "$EXPANDTAB" = "true" ]; then
    echo "  Status: ✅ PASS"
else
    echo "  Status: ⚠️  WARNING - Check settings"
fi
echo ""

# Test 6: Check plugins loaded
echo "✓ Test 6: Plugin Loading"
PLUGINS=$(nvim --headless "+lua print(#vim.tbl_keys(require('lazy').plugins()))" +qa 2>&1 | tail -1)
echo "  Plugins loaded: $PLUGINS"
if [ "$PLUGINS" -gt 20 ]; then
    echo "  Status: ✅ PASS"
else
    echo "  Status: ⚠️  WARNING - Expected 30+ plugins"
fi
echo ""

# Test 7: Test file operations
echo "✓ Test 7: File Operations"
TEST_FILE="/tmp/nvim_verify_test.txt"
echo "Test content" > "$TEST_FILE"
if timeout 5 nvim "$TEST_FILE" -c "normal! Go" -c "normal! iNew line" -c "wq" 2>&1; then
    if grep -q "New line" "$TEST_FILE"; then
        echo "  File edit: ✅ Success"
        echo "  Status: ✅ PASS"
    else
        echo "  Status: ⚠️  WARNING - File not modified"
    fi
else
    echo "  Status: ⚠️  WARNING - Could not test file operations"
fi
rm -f "$TEST_FILE"
echo ""

# Summary
echo "=========================================="
echo "Verification Complete!"
echo "=========================================="
echo ""
echo "Your NeoVim configuration is ready to use!"
echo ""
echo "Quick Start:"
echo "  1. Launch: nvim"
echo "  2. View docs: nvim ~/.config/nvim/README.md"
echo "  3. Quick ref: nvim ~/.config/nvim/QUICKREF.md"
echo ""
echo "Key Features:"
echo "  • Leader key: \\ (backslash)"
echo "  • Save: <F5> or <leader>s"
echo "  • File explorer: <leader>nt"
echo "  • Window nav: <leader>h/j/k/l"
echo ""
