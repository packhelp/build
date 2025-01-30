# Just is a handy task runner, a Makefile replacement
# Install with `brew install just`, read more at https://github.com/casey/just
# After installing, run `just`

# Default task when using `just`; show usage
_default:
	@just --list --unsorted

retag tag='v1':
	git tag {{tag}} -f
	git push --tags -f
