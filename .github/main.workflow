workflow "Basic Check" {
  on = "push"
  resolves = ["Unit Test"]
}

action "Code Style" {
  uses = "CyberZHG/github-action-python-lint@master"
  args = "--max-line-length=120 keras_bert tests"
}

action "Unit Test" {
  uses = "CyberZHG/github-action-python-test@master"
  args = "--with-coverage --cover-erase --cover-html --cover-html-dir=htmlcov --cover-package=keras_bert tests"
  needs = ["Code Style"]
}
