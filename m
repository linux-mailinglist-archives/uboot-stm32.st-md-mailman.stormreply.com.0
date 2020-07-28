Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21912306FA
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81A62C36B2F
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D902BC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9m59Z020731; Tue, 28 Jul 2020 11:51:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2l8PZQZVTDNpEpD9hz1AGRKVxCcnQ96j395zFyn7NuQ=;
 b=fOENBtg6bk/34hwRgRWPTDo82o0YBI+l1S5cV3P5XGTUSU4zZrFMDnGsW+78EcjmyUpu
 6egl+heUfxb6An+qwmBOrYru9TVp8bdX60mtilebNBXQ3i9rnSZc78HPz6qxVmC28rgk
 NzgVEbRbv+pT7rHXY1HW3DgXdVBFqLnSTqhQUeWG41FAib5L/Ch/HOvWiO3MDoIhl3ub
 T7d35KdXblTFyGpznk8sRFvTmRR3zdxVkBxJjv8Ci9wzKV84X2THPvRX9KZyU7si10bq
 /SIp/hD0SqaAW4FWoBWIaw8t5TegkZ2VYGpP4osKkiZrREdnTiI/7NgpRNnpn2JZ8wv+ kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmg5dy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2530E100034;
 Tue, 28 Jul 2020 11:51:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18B6C2A70DB;
 Tue, 28 Jul 2020 11:51:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:42 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:23 +0200
Message-ID: <20200728095128.2363-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728095128.2363-1-patrick.delaunay@st.com>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 10/14] configs: sandbox: activate command
	env select and env load
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

Add support of environment location with the new env command:
'env select' and 'env load'

The ENV backend is selected by priority order
- 0 = "nowhere" (default at boot)
- 1 = "EXT4"

To test EXT4 env support, this backend is selected by name:
> env select EXT4

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v3)

Changes in v3:
- replace specific sandbox command by generic command
  'env select' and 'env load'
- change title "sandbox: support the change of env location"

Changes in v2:
- change cmd_tbl_t to struct cmd_tbl

 configs/sandbox64_defconfig        | 2 ++
 configs/sandbox_defconfig          | 2 ++
 configs/sandbox_flattree_defconfig | 2 ++
 configs/sandbox_spl_defconfig      | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 66bf794f7f..d19c6dfba9 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -31,6 +31,8 @@ CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_NVEDIT_INFO=y
+CONFIG_CMD_NVEDIT_LOAD=y
+CONFIG_CMD_NVEDIT_SELECT=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index a01711cbaf..04efc9b50b 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -35,6 +35,8 @@ CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_NVEDIT_INFO=y
+CONFIG_CMD_NVEDIT_LOAD=y
+CONFIG_CMD_NVEDIT_SELECT=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index eef7e182f1..60d065b8c5 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -25,6 +25,8 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
 CONFIG_CMD_NVEDIT_INFO=y
+CONFIG_CMD_NVEDIT_LOAD=y
+CONFIG_CMD_NVEDIT_SELECT=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 1c3d9a1eae..40605626e5 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -35,6 +35,8 @@ CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_INFO=y
+CONFIG_CMD_NVEDIT_LOAD=y
+CONFIG_CMD_NVEDIT_SELECT=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
