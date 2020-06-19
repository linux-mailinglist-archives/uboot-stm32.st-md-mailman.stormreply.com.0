Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175A200833
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:56:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A82FC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:56:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C29ECC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:56:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBuOu0030156; Fri, 19 Jun 2020 13:56:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HUJDtDR4I5h1gMymgE3y4mS77EW+gFV1vekuGi/uS4A=;
 b=wwTdTnqD3iOwKNHDhhLVjLKg9731f9y4NywQ5LWmd5x6sR4xeNsdYhlqz1nGuwxrU8eT
 CaAgggqsKPuCLlKbxhiZDZTLZyMor3NnwpfZYRwNbFcKyi+ztM1cULi7JBoeQcAStmjJ
 lrf0yZ6jfQiPcSy4lYRnNkrHD0hxUFqcFHwRkyWClt8RB2rF+i+6m3G492flVLojHUq1
 WxN193u74DZCOEL4kwLj6hAKaTmE8JanYseDLNVKEIe3rA1STOni7PvWoeVYFa2XaWZ8
 fq73KWcdwuWW4JMty0MN8NoF5iGTaWhV7NWVUvSsh3h1bCco25dbDFu3qUscdJ+rtotK qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q649rndm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:56:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11F66100038;
 Fri, 19 Jun 2020 13:56:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08C532BF9CC;
 Fri, 19 Jun 2020 13:56:23 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 13:56:22 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 13:56:10 +0200
Message-ID: <20200619115611.16375-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619115611.16375-1-patrick.delaunay@st.com>
References: <20200619115611.16375-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v5 4/5] configs: sandbox: Enable sub command
	'env info'
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
