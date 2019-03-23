workflow "Python Lint" {
  on = "push"
  resolves = ["PyCodeStyle"]
}

action "PyCodeStyle" {
  uses = "CyberZHG/github-action-python-lint@master"
  args = "--max-line-length=120 keras_bert tests"
}
