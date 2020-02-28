load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@com_github_masmovil_bazel_rules//repositories:helm_repositories.bzl", "helm_repositories")
load("@com_github_masmovil_bazel_rules//repositories:yq_repositories.bzl", "yq_repositories")
load("@com_github_masmovil_bazel_rules//repositories:kubectl_repositories.bzl", "kubectl_repositories")
load("@com_github_masmovil_bazel_rules//repositories:sops_repositories.bzl", "sops_repositories")

def repositories():
  """Download dependencies of container rules."""
  excludes = native.existing_rules().keys()

  kubectl_repositories()
  helm_repositories()
  yq_repositories()
  sops_repositories()

  native.register_toolchains(
    # Register the default docker toolchain that expects the 'docker'
    # executable to be in the PATH
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_windows_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm:helm_v2.13.0_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm:helm_v2.13.0_osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm-2-16:helm_v2.16.1_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm-2-16:helm_v2.16.1__osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm-3:helm_v3.1.0_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/helm-3:helm_v3.1.0__osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/kubectl:kubectl_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/kubectl:kubectl_osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/sops:sops_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/sops:sops_osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/sops:sops_windows_toolchain"
  )