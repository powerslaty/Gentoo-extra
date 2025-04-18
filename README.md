# Gentoo-extra Overlay

Welcome to **Gentoo-extra**, the most absurd and nonsensical Gentoo overlay you’ll ever encounter! This repository is a labor of chaos and, dare I say, brilliance that **belongs entirely to me**—the one and only **powerslaty**.

## What is This?

This is a Gentoo overlay. Why? Because I can. It’s a collection of ebuilds that may or may not make sense, solve problems, or even work at all. But hey, that’s the beauty of it! It’s unapologetically **stupid** and yet immeasurably **belongful** to its creator.

## Why Use Gentoo-extra?

Honestly, I have no idea. Are you looking for packages you didn’t know you didn’t need? Do you enjoy the thrill of uncertainty? Do you trust me with your system? If the answer to any of these questions is "yes" (or even "maybe"), then you’re in the right place.

## How to Add This Overlay

For the brave souls who want to dive into this madness:
```bash
eselect repository enable gentoo-extra
```

Or, for those who prefer the manual route:
```bash
sudo mkdir -p /etc/portage/repos.conf
sudo tee /etc/portage/repos.conf/gentoo-extra.conf <<EOF
[gentoo-extra]
location = /usr/local/portage/gentoo-extra
sync-type = git
sync-uri = https://github.com/powerslaty/Gentoo-extra.git
priority = 9999
EOF
```

And then:
```bash
emerge --sync gentoo-extra
```

## Disclaimer

This overlay comes with no warranty, no promises, and no apologies. Use it at your own risk. If you break your system, remember: **it belongs to you as much as this overlay belongs to me**.

## Contributions

If you’d like to contribute to this ridiculous repository, open a pull request or submit an issue. I might review it, or I might just laugh at it. Either way, you’ll have my attention.

---

Thanks for stopping by! Now go forth and embrace the stupidity of Gentoo-extra.
```

Let me know if you'd like any changes or additions!
