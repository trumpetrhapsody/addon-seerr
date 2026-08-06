# Home Assistant Add-on: Seerr

[Seerr] is a free, open-source request management and media discovery tool for Jellyfin, Plex, and Emby. The unified evolution of Overseerr and Jellyseerr.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Add this repository to your Home Assistant Add-on Store:
   - Go to **Settings → Add-ons → Add-on Store**
   - Click **⋮** (three dots menu) → **Repositories**
   - Add this URL: `https://github.com/trumpetrhapsody/addon-seerr`
   - Click **Add** → **Close**

2. Find "Seerr" in the add-on store and install it

3. In the **Configuration** tab, ensure `prefer_ipv4: true` is set

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

## Authors & contributors

The original setup of this repository is by [trumpetrhapsody].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2024 trumpetrhapsody

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=30e2c870_seerr&repository_url=https%3A%2F%2Fgithub.com%2Ftrumpetrhapsody%2Faddon-seerr
[releases]: https://github.com/trumpetrhapsody/addon-seerr/releases
[trumpetrhapsody]: https://github.com/trumpetrhapsody
[contributors]: https://github.com/trumpetrhapsody/addon-seerr/graphs/contributors
[seerr]: https://seerr.dev/
[semver]: http://semver.org/spec/v2.0.0.html
