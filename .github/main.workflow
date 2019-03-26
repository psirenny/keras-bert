workflow "Code Style" {
  on = "push"
  resolves = ["lint-action"]
}

action "lint-action" {
  uses = "CyberZHG/github-action-python-lint@master"
  args = "--max-line-length=120 keras_bert tests"
}

workflow "Unit Test" {
  on = "push"
  resolves = ["test-action"]
}

action "test-action" {
  uses = "CyberZHG/github-action-python-test@master"
  args = "--with-coverage --cover-erase --cover-html --cover-html-dir=htmlcov --cover-package=keras_bert tests"
}
