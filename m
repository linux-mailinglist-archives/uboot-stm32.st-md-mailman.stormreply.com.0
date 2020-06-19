Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1720084C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 14:03:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEFCBC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 12:03:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6AC0C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 12:03:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBuWxH009318; Fri, 19 Jun 2020 14:03:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HUJDtDR4I5h1gMymgE3y4mS77EW+gFV1vekuGi/uS4A=;
 b=znzSpHfUxpwxfPTqOtDJjHVTDHxErpIGJgtExKAzRuLTI11M8BvKOsxQIJKHWD4Y/KtB
 6tB3LDH0w1kwffDHEcfSRjaEkxdmonR+A/2YqQqcLx0t2qufmAM+60RGfdvHb17lVtAL
 5Wr8Dv3wy2vyeCCuP9hx00rXBwf/hKuC8VFU45TVy4HRKdBa//0Cem4iy44dp56F6qZ3
 7tXeuy/1W9I/Z3nkRG69pQ39iz71upbRSG/096E3yeEMdSnUgzqOPyCNYwNmjjD1ueYf
 NpK9X/FboDj0Xxlrb5199B472SXXzLsihYQYYYqIqd2FVYaghMLD4x82KOI3ciVciSmt MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64armhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 14:03:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2501C100034;
 Fri, 19 Jun 2020 14:03:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B3212C0D31;
 Fri, 19 Jun 2020 14:03:48 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 14:03:47 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 14:03:36 +0200
Message-ID: <20200619120337.17042-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619120337.17042-1-patrick.delaunay@st.com>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH v5 3/4] configs: sandbox: Enable sub
	command 'env info'
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

Enable support for sub command 'env info' in sandbox
with CONFIG_CMD_NVEDIT_INFO. This is aimed primarily
at adding unit test.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v2)

Changes in v2:
- activate env info command in sandbox (new)

 configs/sandbox64_defconfig        | 1 +
 configs/sandbox_defconfig          | 1 +
 configs/sandbox_flattree_defconfig | 1 +
 configs/sandbox_spl_defconfig      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index a3f049e124..a2410b3368 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 5b7569319b..0c9e0b9f1f 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
 CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 21f9047046..bc4819f998 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -24,6 +24,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index fc8b26e88c..64f2ed5102 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -34,6 +34,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
