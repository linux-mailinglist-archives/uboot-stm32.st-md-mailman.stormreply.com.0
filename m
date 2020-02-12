Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBB15B015
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F67C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AC5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgmr8006915; Wed, 12 Feb 2020 19:45:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=i7Vhq2AKy88I6syR3OsQ1Jp/4BTcvRJJs9TFoUqgET8=;
 b=Y+zxxYHsUHoPZ5gqBUnr5/arJ/q94Sz4kXAT7CGKfjETmlQAmKAsue5YPGklulN+cNsU
 EqMit4vf460nRmBawfUE1zocBAIGIxVyzSeIT8MkyKKm4Z5WNx2TBOeuKj1QXBDm8Wpk
 sdeFSvBi92u29npT1CvaJ4FD+K62Q3gu76uA9/6an3Yxzk+cuitB6gAvDtaroFpR4hid
 re0QS7DCn/7tA2YRUYfn4jBgKTgnDCDcD9fiKzAZgtJ+clPjbQCCRlFyXlSvcq455i1o
 bE8AdgIgrncWAcnGhQJ7EKnJ/G7y5WvoLFmYxVKg2CqYtO5De+ln6NV2NEF6j+MJWMVY XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhg7px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5F6F100038;
 Wed, 12 Feb 2020 19:45:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACC412C60B1;
 Wed, 12 Feb 2020 19:45:11 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:11 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:45:01 +0100
Message-ID: <20200212184501.5911-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 10/10] test: sandbox: add test for
	erase command
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

 configs/sandbox64_defconfig        |  1 +
 configs/sandbox_defconfig          |  1 +
 configs/sandbox_flattree_defconfig |  1 +
 configs/sandbox_spl_defconfig      |  1 +
 test/py/tests/test_env.py          | 20 ++++++++++++++++++--
 5 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 6172259924..a92dc957e8 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -25,6 +25,7 @@ CONFIG_CMD_BOOTZ=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_INFO=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 28a6211189..82a980e652 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -29,6 +29,7 @@ CONFIG_CMD_ABOOTIMG=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_INFO=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 1324aaca37..93d587fe38 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_BOOTZ=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index eadcdb9f43..2337eade06 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_BOOTZ=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_INFO=y
diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index d35ad888a7..a71b4c2571 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -423,7 +423,7 @@ def test_env_ext4(state_test_env):
     response = c.run_command('ext4ls host 0:0')
     assert 'uboot.env' not in response
 
-    """ env_location: ENVL_EXT4 (2)
+    """ env location: ENVL_EXT4 (2)
     """
     response = c.run_command('env_loc 2')
     assert 'Saving Environment to EXT4' in response
@@ -453,7 +453,23 @@ def test_env_ext4(state_test_env):
     response = c.run_command('echo $?')
     assert response == "0"
 
-    """ restore env_location: ENVL_NOWHERE (12)
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
+    """ restore env location: ENVL_NOWHERE (12)
     """
     c.run_command('env_loc 12')
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
