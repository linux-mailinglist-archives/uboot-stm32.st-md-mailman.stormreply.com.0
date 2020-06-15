Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 408721F997F
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 16:01:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09F1DC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 14:01:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D378C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 14:01:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FDtoWg023258; Mon, 15 Jun 2020 16:01:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=g34uyNKaL25xgtRh+qILBGImTstZhXWm4SZ04Q8PRqQ=;
 b=NMvqcwsCFH18LLNrdPGckkRkiVK2ICmFtxnjKDta9IbpO9jFjWxNQUy2LbtI/vioEpfg
 crYlAdkvOmTtBjmY8aqsFsTvYPfp2y8EXy4O/MMdaBoS4iL4HCefmgFaetuHV1SpC02W
 ptUr/lwcW1RHoIQuNOR1lw05ItEDs4tiZpvtwbi2+oIM+yKcoy8BInZYb28fzhdGyJWi
 AqvY9pHkAjG9sYfndq1auOLbyKuGtr79MO9CfrfQmhHDckJAIMyebnxNVQiWD+ZDYKsP
 oSgf2BLWxlj6VawzHvHF9ujFb2EpESrlwOhwmz4A4PuQ3badb7K5Fx05IYPUGZE/QZEE 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91j1xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:01:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00B5210002A;
 Mon, 15 Jun 2020 16:01:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECAD92B427C;
 Mon, 15 Jun 2020 16:01:42 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 16:01:42 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 16:01:37 +0200
Message-ID: <20200615140137.21186-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615140137.21186-1-patrick.delaunay@st.com>
References: <20200615140137.21186-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 4/4] test: env: add test for env info
	sub-command
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Add a pytest for testing the env info sub-command:

test_env_info: test command with several option

test_env_info_quiet: test the result of the sub-command with quiet option,
'-q' as used for support in shell test; for example:
  if env info -p -d -q; then env save; fi

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v4:
- rebase on master branch
- move 5/7 stm32mp1: configs: activate CMD_ERASEENV
  in a new serie 183380
- move 2/7 and 4/7 in a new serie 183387

Changes in v3:
- update commit message (sub-commandi)
- rename test_env_info_test to test_env_info_quiet

Changes in v2:
- add pytest test_env_info and test_env_info_test (new)

 test/py/tests/test_env.py | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index 6ff38f1020..cbdb41031c 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -336,3 +336,47 @@ def test_env_import_whitelist_delete(state_test_env):
     unset_var(state_test_env, 'foo2')
     unset_var(state_test_env, 'foo3')
     unset_var(state_test_env, 'foo4')
+
+@pytest.mark.boardspec('sandbox')
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+def test_env_info(state_test_env):
+
+    """Test 'env info' command with several options.
+    """
+    c = state_test_env.u_boot_console
+
+    response = c.run_command('env info')
+    assert 'env_valid = invalid' in response
+    assert 'env_ready = true' in response
+    assert 'env_use_default = true' in response
+
+    response = c.run_command('env info -p -d')
+    assert 'Default environment is used' in response
+    assert 'Environment cannot be persisted' in response
+
+    response = c.run_command('env info -p -d -q')
+    assert response == ""
+
+@pytest.mark.boardspec('sandbox')
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+@pytest.mark.buildconfigspec('cmd_echo')
+def test_env_info_quiet(state_test_env):
+
+    """Test 'env info' quiet command result with several options for test.
+    """
+    c = state_test_env.u_boot_console
+
+    response = c.run_command('env info -d -q')
+    assert response == ""
+    response = c.run_command('echo $?')
+    assert response == "0"
+
+    response = c.run_command('env info -p -q')
+    assert response == ""
+    response = c.run_command('echo $?')
+    assert response == "1"
+
+    response = c.run_command('env info -d -p -q')
+    assert response == ""
+    response = c.run_command('echo $?')
+    assert response == "1"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
