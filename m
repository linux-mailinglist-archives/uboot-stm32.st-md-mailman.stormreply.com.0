Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0726B1FAA26
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2838C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79359C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e27D007333; Tue, 16 Jun 2020 09:40:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Vc3ghUXyZMAB8TYkFy3EF0WY5Hli2ca6cgS3+AiK3oY=;
 b=SKHHG2JTk6zcLfrs+mqacInFT4zqvFnbBXeAJWJ7SxXQfj3lclHDfPggEFlTyTM37G9+
 cc576LUiTXpTk9bQmi2DTtyUpy1DbAuNJbJEvjyqxmspDWhSem1cSnb5AjgJnzz8B/lR
 ynKteb7M2740nqCzMgX36PrtrJfGT87LjkzK/2auFMckgQgINX1U5zcBSlBzuqyCCmXe
 gl+I+eUQ+99dsv1rk6+kZhgU7pq/3J1dCKIJTt/LMkgXy+2H7FBciHy1N0ILpD28BWgr
 3lqExJWJpMqjjy3wztW7xVNxoAzA7ckg2PjeVmQrecaLL9inNFaud/aUwOP0tc0Hua+A oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx95x2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BA39100038;
 Tue, 16 Jun 2020 09:40:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 312972AEF93;
 Tue, 16 Jun 2020 09:40:57 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:48 +0200
Message-ID: <20200616074048.7898-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 9/9] test: sandbox: add test for erase
	command
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

Add test for the erase command tested on ENV in EXT4.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 configs/sandbox64_defconfig        |  1 +
 configs/sandbox_defconfig          |  1 +
 configs/sandbox_flattree_defconfig |  1 +
 configs/sandbox_spl_defconfig      |  1 +
 test/py/tests/test_env.py          | 16 ++++++++++++++++
 5 files changed, 20 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index b70272c0b0..3913b6392e 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 715f5dc39d..c59e20579d 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_ABOOTIMG=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index ce806270bd..99b750b4f8 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index ea11c9bded..52e7625bd7 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -32,6 +32,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_INFO=y
diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index 6f1d94b953..a71b4c2571 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -453,6 +453,22 @@ def test_env_ext4(state_test_env):
     response = c.run_command('echo $?')
     assert response == "0"
 
+    response = c.run_command('env erase')
+    assert 'OK' in response
+
+    response = c.run_command('env_loc 2')
+    assert 'Loading Environment from EXT4... ' in response
+    assert 'bad CRC, using default environment' in response
+
+    response = c.run_command('env info')
+    assert 'env_valid = invalid' in response
+    assert 'env_ready = true' in response
+    assert 'env_use_default = true' in response
+
+    response = c.run_command('env info -p -d')
+    assert 'Default environment is used' in response
+    assert 'Environment can be persisted' in response
+
     """ restore env location: ENVL_NOWHERE (12)
     """
     c.run_command('env_loc 12')
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
