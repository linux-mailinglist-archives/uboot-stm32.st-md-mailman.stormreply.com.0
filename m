Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2556200836
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:56:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C38AC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:56:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 338FCC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:56:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBuP88008724; Fri, 19 Jun 2020 13:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Dm/wJppnXE9dc96JrChh8gtQXA5mG6bWsrn+24/3VNI=;
 b=JeO93CEgAarY7CciyMqPp5HX0THjsFdqwkWTc7p6IzdKLkYKUG+62bArMC1+tJyUP4CQ
 5SUvLa95BXB3dhDmFgjpzdpMqO+MYpiStEnkwN20yVz69O1cTo9nBbQef7SEwQfRpZxa
 hrNPZeeiiqWfLo6i2+Jl+JS9RbC+OREmSgt5KC5ZuC27KU4g/iQWv3K7VUYofsgk9kOE
 rwkHmE00L96szc1ck3OTbPKsIseF08tNNhq66hdcrUf6hrrFztceJcGj5/31Kw0WF9Bh
 WXD8YRnjpmg9dUH5dZxvw6BBKwaXZanmdsoJrTeZPLUFsLOgN7lojSHtFNEhSDG0A72d Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64arkex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:56:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7410100039;
 Fri, 19 Jun 2020 13:56:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF2E22BF9CC;
 Fri, 19 Jun 2020 13:56:23 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 13:56:23 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 13:56:11 +0200
Message-ID: <20200619115611.16375-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619115611.16375-1-patrick.delaunay@st.com>
References: <20200619115611.16375-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v5 5/5] test: env: add test for env info
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

test_env_info: test command with several option that
can be executed on real hardware device without assumption

test_env_info_sandbox: test the result on sandbox
with a known ENV configuration: ready & default & persistent

The quiet option '-q' is used for support in shell test;
for example:
  if env info -p -d -q; then env save; fi

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v5:
- allow to execute cmd_nvedit_info on real board
- rename test_env_info_quiet to test_env_info_sandbox

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

 test/py/tests/test_env.py | 63 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index 6ff38f1020..a64aaa9bc5 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -336,3 +336,66 @@ def test_env_import_whitelist_delete(state_test_env):
     unset_var(state_test_env, 'foo2')
     unset_var(state_test_env, 'foo3')
     unset_var(state_test_env, 'foo4')
+
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+def test_env_info(state_test_env):
+
+    """Test 'env info' command with all possible options.
+    """
+    c = state_test_env.u_boot_console
+
+    response = c.run_command('env info')
+    nb_line = 0
+    for l in response.split('\n'):
+        if 'env_valid = ' in l:
+            assert '= invalid' in l or '= valid' in l or '= redundant' in l
+            nb_line += 1
+        elif 'env_ready =' in l or 'env_use_default =' in l:
+            assert '= true' in l or '= false' in l
+            nb_line += 1
+        else:
+            assert true
+    assert nb_line == 3
+
+    response = c.run_command('env info -p -d')
+    assert 'Default environment is used' in response or "Environment was loaded from persistent storage" in response
+    assert 'Environment can be persisted' in response or "Environment cannot be persisted" in response
+
+    response = c.run_command('env info -p -d -q')
+    assert response == ""
+
+    response = c.run_command('env info -p -q')
+    assert response == ""
+
+    response = c.run_command('env info -d -q')
+    assert response == ""
+
+@pytest.mark.boardspec('sandbox')
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+@pytest.mark.buildconfigspec('cmd_echo')
+def test_env_info_sandbox(state_test_env):
+
+    """Test 'env info' command result with several options on sandbox
+       with a known ENV configuration: ready & default & persistent
+    """
+    c = state_test_env.u_boot_console
+
+    response = c.run_command('env info')
+    assert 'env_ready = true' in response
+    assert 'env_use_default = true' in response
+
+    response = c.run_command('env info -p -d')
+    assert 'Default environment is used' in response
+    assert 'Environment cannot be persisted' in response
+
+    response = c.run_command('env info -d -q')
+    response = c.run_command('echo $?')
+    assert response == "0"
+
+    response = c.run_command('env info -p -q')
+    response = c.run_command('echo $?')
+    assert response == "1"
+
+    response = c.run_command('env info -d -p -q')
+    response = c.run_command('echo $?')
+    assert response == "1"
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
