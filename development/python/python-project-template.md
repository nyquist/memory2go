

```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
mkdir my_python_project
cd my_python_project
pipx install pipenv
pipenv install black isort flake8 mypy pytest pytest-cov --dev
cat << 'EOF' >> setup.cfg
[isort]
multi_line_output=3
include_trailing_comma=True
force_grid_wrap=0
use_parentheses=True
line_length=88
[flake8]
ignore = E203, E266, E501, W503
max-line-length = 88
max-complexity = 18
select = B,C,E,F,W,T4
[mypy]
files=best_practices,test
ignore_missing_imports=true
[tool:pytest]
testpaths=test
EOF 

cat << 'EOF' >> .coveragerc
[run]
source = best_practices

[report]
exclude_lines =
    # Have to re-enable the standard pragma
    pragma: no cover

    # Don't complain about missing debug-only code:
    def __repr__
    if self\.debug

    # Don't complain if tests don't hit defensive assertion code:
    raise AssertionError
    raise NotImplementedError

    # Don't complain if non-runnable code isn't run:
    if 0:
    if __name__ == .__main__.:
EOF

cat << 'EOF' >> .pre-commit-config.yaml
repos:
  - repo: local
    hooks:
      - id: isort
        name: isort
        stages: [commit]
        language: system
        entry: pipenv run isort
        types: [python]

      - id: black
        name: black
        stages: [commit]
        language: system
        entry: pipenv run black
        types: [python]

      - id: flake8
        name: flake8
        stages: [commit]
        language: system
        entry: pipenv run flake8
        types: [python]
        exclude: setup.py

      - id: mypy
        name: mypy
        stages: [commit]
        language: system
        entry: pipenv run mypy
        types: [python]
        pass_filenames: false

      - id: pytest
        name: pytest
        stages: [commit]
        language: system
        entry: pipenv run pytest
        types: [python]

      - id: pytest-cov
        name: pytest
        stages: [push]
        language: system
        entry: pipenv run pytest --cov --cov-fail-under=100
        types: [python]
        pass_filenames: false
```
Run:
```
pipenv run black
pipenv run isort
pipenv run flake8
pipenv run mypy
pipenv run pytest
pipenv run pytest --cov --cov-fail-under=100
git commit --no-verify
git push --no-verify
```

References
- pipx: https://pipxproject.github.io/pipx/
- pipenv: https://github.com/pypa/pipenv
- black: https://github.com/psf/black
- flake8: https://pypi.org/project/flake8/
- mypy: http://mypy-lang.org/
- pytest: https://docs.pytest.org/en/latest/

https://github.com/sourceryai/python-best-practices-cookiecutter


