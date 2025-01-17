#!/usr/bin/env bash

# Copyright 2022 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

run_kubectl_help_tests() {
  set -o nounset
  set -o errexit

  # The purpose of this test is to exercise the translation functionality in a simple way.
  # If the strings used by this test are changed, they will need to be updated here so that this test will pass.

  kube::test::if_has_string "$(kubectl help)" "Modify kubeconfig files"
  kube::test::if_has_string "$(LANG=de_DE.UTF8 kubectl help)" "Verändere kubeconfig Dateien"
  kube::test::if_has_string "$(LANG=en_US.UTF8 kubectl help)" "Modify kubeconfig files"
  kube::test::if_has_string "$(LANG=fr_FR.UTF8 kubectl help)" "Modifier des fichiers kubeconfig"
  kube::test::if_has_string "$(LANG=it_IT.UTF8 kubectl help)" "Modifica i file kubeconfig"
  kube::test::if_has_string "$(LANG=ja_JP.UTF8 kubectl help)" "kubeconfigを変更する"
  kube::test::if_has_string "$(LANG=ko_KR.UTF8 kubectl help)" "kubeconfig 파일을 수정합니다"
  kube::test::if_has_string "$(LANG=pt_BR.UTF8 kubectl help)" "Edita o arquivo kubeconfig"
  kube::test::if_has_string "$(LANG=zh_CN.UTF8 kubectl help)" "修改 kubeconfig 文件"
  kube::test::if_has_string "$(LANG=zh_TW.UTF8 kubectl help)" "修改 kubeconfig 檔案"

  kube::test::if_has_string "$(kubectl uncordon --help)" "Mark node as schedulable."
  kube::test::if_has_string "$(LANG=de_DE.UTF-8 kubectl uncordon --help)" "Markiere Knoten als schedulable."
  kube::test::if_has_string "$(LANG=en_US.UTF-8 kubectl uncordon --help)" "Mark node as schedulable."
  kube::test::if_has_string "$(LANG=fr_FR.UTF-8 kubectl uncordon --help)" "Mark node as schedulable."
  kube::test::if_has_string "$(LANG=it_IT.UTF-8 kubectl uncordon --help)" "Contrassegna il nodo come programmabile."
  kube::test::if_has_string "$(LANG=ja_JP.UTF-8 kubectl uncordon --help)" "Mark node as schedulable."
  kube::test::if_has_string "$(LANG=ko_KR.UTF-8 kubectl uncordon --help)" "Mark node as schedulable."
  kube::test::if_has_string "$(LANG=pt_BR.UTF-8 kubectl uncordon --help)" "Remove a restrição de execução de workloads no node."
  kube::test::if_has_string "$(LANG=zh_CN.UTF-8 kubectl uncordon --help)" "标记节点为可调度。"
  kube::test::if_has_string "$(LANG=zh_TW.UTF-8 kubectl uncordon --help)" "標記節點爲可調度。"

  set +o nounset
  set +o errexit
}
