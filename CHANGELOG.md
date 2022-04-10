# Changelog

Notable changes to this project will be documented in this file.

## [2.2.0](https://github.com/mvz/non-digest-assets/tree/v2.2.0)

This release adds support for Ruby 3.1.

### Merged pull requests

- Loosen development dependency version constraints [\#73](https://github.com/mvz/non-digest-assets/pull/73) ([mvz](https://github.com/mvz))
- Inherit default RuboCop exclusions [\#68](https://github.com/mvz/non-digest-assets/pull/68) ([mvz](https://github.com/mvz))
- Test with Ruby 3.1 in CI [\#64](https://github.com/mvz/non-digest-assets/pull/64) ([mvz](https://github.com/mvz))
- Improve development experience [\#63](https://github.com/mvz/non-digest-assets/pull/63) ([mvz](https://github.com/mvz))

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/v2.1.0...v2.2.0)

## [2.1.0](https://github.com/mvz/non-digest-assets/tree/v2.1.0)

This release adds support for Rails 7.0.

### Merged pull requests

- Finalize Rails 7 support [\#61](https://github.com/mvz/non-digest-assets/pull/61) ([mvz](https://github.com/mvz))
- Support Rails 7.0 [\#57](https://github.com/mvz/non-digest-assets/pull/57) ([brian-kephart](https://github.com/brian-kephart))

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/v2.0.0...v2.1.0)

## [2.0.0](https://github.com/mvz/non-digest-assets/tree/v2.0.0) (2021-10-08)

- Remove deprecated methods `whitelist`, `whitelist=`, and `assets` [\#54](https://github.com/mvz/non-digest-assets/pull/54) ([mvz](https://github.com/mvz))
- Drop support for Ruby 2.5 [\#52](https://github.com/mvz/non-digest-assets/pull/52) ([mvz](https://github.com/mvz))

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/v1.2.0...v2.0.0)

## [1.2.0](https://github.com/mvz/non-digest-assets/tree/v1.2.0) (2021-07-30)

### Summary

- Drop support for Ruby 2.4 and Rails 5.1 and lower
- Deprecate `whitelist` setting in favor of `asset_selectors`
- Do not clobber files if logical path and digest path are the same

### Fixed bugs

- Release 1.1.0 breaks the asset compilation [\#34](https://github.com/mvz/non-digest-assets/issues/34)

### Merged pull requests

- Copy files more carefully [\#45](https://github.com/mvz/non-digest-assets/pull/45) ([mvz](https://github.com/mvz))
- Deprecate whitelist in favor of new asset\_selectors accessor [\#44](https://github.com/mvz/non-digest-assets/pull/44) ([mvz](https://github.com/mvz))
- Drop support for Ruby 2.4 [\#30](https://github.com/mvz/non-digest-assets/pull/30) ([mvz](https://github.com/mvz))
- Drop support for Rails 5.1 and below [\#29](https://github.com/mvz/non-digest-assets/pull/29) ([mvz](https://github.com/mvz))

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/v1.1.0...v1.2.0)

## [1.1.0](https://github.com/mvz/non-digest-assets/tree/v1.1.0) (2020-05-01)

### Summary

- Preserve atime and mtime attributes even if asset creation is run by different users
- Add tests
- Officially support Rails 6.0 and 6.1, and Ruby 3.0

### Merged pull requests

- Run tests on Ruby 3.0 with Rails 6+ in CI [\#19](https://github.com/mvz/non-digest-assets/pull/19) ([mvz](https://github.com/mvz))
- Add Appraisal for Rails 6.1 [\#18](https://github.com/mvz/non-digest-assets/pull/18) ([mvz](https://github.com/mvz))
- Improve test setup [\#8](https://github.com/mvz/non-digest-assets/pull/8) ([mvz](https://github.com/mvz))
- Remove file first so utime doesn't fail for other users. [\#2](https://github.com/mvz/non-digest-assets/pull/2) ([zbelzer](https://github.com/zbelzer))

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/v1.0.10...v1.1.0)

## [1.0.10](https://github.com/mvz/non-digest-assets/tree/v1.0.10) (2018-06-16)

**Initial release**

- Fork from non-stupid-digest-assets
- Make gem name, code and documentation less angry

[Full Changelog](https://github.com/mvz/non-digest-assets/compare/cb899cc4...v1.0.10)
