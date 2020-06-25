Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF6209AEB
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E662FC36B20
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F52CC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7rKYo013736; Thu, 25 Jun 2020 10:00:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2z7uj03AiWYpND7glwNOHhTWIUecM/nWCGmD774W9g8=;
 b=Vh745KO2H8yLm/vHoIaj1SwF+MyinaPWsAQY5qJ9xrbFuQs8dp7kfPe9iqT/HYyQChea
 iT1bou/QWvfLPl3TC/+Pm8AlO9reWDSzuhf/c3EwDDGqjkgyIUp512RwF3pVLM3rO78Q
 VA8kO+2fNcp4qrXxv9Ib98szdQGZeNHZisMMFiSmRbEKm0AMVl4FUVP2kMgphL8FQleN
 eyon7NU28LYsPmG0bljbDpZjCVjhhFaauIVMDGyOYoHFKrTHVh04lis3JRTJ+7FQ7cmP
 S2tHsoyGbrDbtaxD4vvbSFC9u4psIVrHx3UXLLd/dgr9PjcHWVivsrK8zPXxnBNOvqSk 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuv9gn04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70B7B10003D;
 Thu, 25 Jun 2020 10:00:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6688B2A991A;
 Thu, 25 Jun 2020 10:00:29 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:54 +0200
Message-ID: <20200625075958.9868-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 10/14] configs: sandbox: activate command
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
index b70272c0b0..6b9b3a7b75 100644
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
index 715f5dc39d..5b26fff7c9 100644
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
index ce806270bd..ccbc6374e7 100644
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
index ea11c9bded..534f2d3239 100644
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
