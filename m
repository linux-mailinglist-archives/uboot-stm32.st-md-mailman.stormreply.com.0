Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C28209AEF
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D5AEC36B14
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38AB4C36B14
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7w3sl027786; Thu, 25 Jun 2020 10:00:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SLFMgjqnHulFCEZ/fVmHvYVZdKe942GxfjHN59Rf2SM=;
 b=PVkm2Y9f2LTJEHDLJWJm20gj5bfak7yUIgjVSPWtjh0bHwACs+IXXvNhoNau/1xR1i1t
 E0F/nkPtL3chlKMF7zFAvQ7X8U49CF1t2iizQdOJdJOVpRO10m3GMsbnsBbsA5Ca+4pZ
 zETD0BB6Ic1i6g5zBkEFhXlEJHvBVuT8Lp4NMQa/ohue51dNyisxzq9GgmskBI1BtglW
 UpeEdgLICQ9pYMB9OMJn2UiBdRqXQcHcK1SKrYiNiBysHyCrOQd78wBZLvdOs8PfFZ9A
 YK/5oOuuJpbqcQM7G/5O+4oOP/ho95mKLqdjGQ/yHgJv9YAHwtH3vcZ4Hqi4ecJECMb0 mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuus0ptg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7891410003A;
 Thu, 25 Jun 2020 10:00:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CA5C2A991C;
 Thu, 25 Jun 2020 10:00:32 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:31 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:58 +0200
Message-ID: <20200625075958.9868-15-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 14/14] test: sandbox: add test for erase
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

Changes in v3:
- replace sandbox command by generic command 'env load' in test_env

 configs/sandbox64_defconfig        |  1 +
 configs/sandbox_defconfig          |  1 +
 configs/sandbox_flattree_defconfig |  1 +
 configs/sandbox_spl_defconfig      |  1 +
 test/py/tests/test_env.py          | 16 ++++++++++++++++
 5 files changed, 20 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 6b9b3a7b75..906b92de8c 100644
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
index 5b26fff7c9..97953fda08 100644
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
index ccbc6374e7..ba9f652689 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ERASEENV=y
 CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_CMD_NVEDIT_LOAD=y
 CONFIG_CMD_NVEDIT_SELECT=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 534f2d3239..fb54c86bf6 100644
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
index 70913c8d9a..86ec1b36d3 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -475,6 +475,22 @@ def test_env_ext4(state_test_env):
         response = c.run_command('echo $?')
         assert response == "0"
 
+        response = c.run_command('env erase')
+        assert 'OK' in response
+
+        response = c.run_command('env load')
+        assert 'Loading Environment from EXT4... ' in response
+        assert 'bad CRC, using default environment' in response
+
+        response = c.run_command('env info')
+        assert 'env_valid = invalid' in response
+        assert 'env_ready = true' in response
+        assert 'env_use_default = true' in response
+
+        response = c.run_command('env info -p -d')
+        assert 'Default environment is used' in response
+        assert 'Environment can be persisted' in response
+
         # restore env location: NOWHERE (prio 0 in sandbox)
         response = c.run_command('env select nowhere')
         assert 'Select Environment on nowhere: OK' in response
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
