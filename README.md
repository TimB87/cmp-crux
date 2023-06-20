cmp-crux
========

nvim-cmp source for CRUX prt-get/prt-cache packages available on a system.

Only works when fitetype is `Pkgfile`.

## Setup
Add the provider to the sources table:

```lua
cmp.setup({
  sources = {
    {
      name = 'crux',
    },
  },
})
```
