Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB3415A94F
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 13:40:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39EEDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 12:40:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C85D1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 12:40:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CCWXw9014064; Wed, 12 Feb 2020 13:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Kf+1LuAySt9NtHmXgNpuXc2o/se/l1rcq3+dL1wN/JU=;
 b=HNwjSdJvpQMXVyC3p9H+wBy+5mGcSpGuX5gX1p4jAfOtuq8eRIuXJI4XQAL8pcyGawvB
 21cF1BdUfZtOP3+YxxWHsGB4T5S8yogckr2oxxByHyCi1oR+EIAogMVM8dMH74Jnir9+
 Q9iEEXX0uA5zRgN4OKyC7FXcAPWVqMeFTGG0CUZxAWczOboJJ/dT7t558vvaCk9EF3/0
 GB5S+PwBANoq743ixV+piJ0Ovq8l8zXqk8b8c1kEdR2LW/ZbSyz15kCJbAAewin9dYdi
 BYTRxh3pYglxQpyaqFSB4i0ZiFuYhhhx1EvTnh4OY6PqcWl202oStSf/gqV492Gm3aLl 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhegsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 13:40:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A560D100034;
 Wed, 12 Feb 2020 13:40:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CBA42B1867;
 Wed, 12 Feb 2020 13:40:08 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 13:40:08 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 13:40:00 +0100
Message-ID: <20200212124001.12788-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212124001.12788-1-patrick.delaunay@st.com>
References: <20200212124001.12788-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_06:2020-02-11,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 7/7] test: env: add test for env info
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

Changes in v3:
- udpate commit message (sub-commandi)
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
