Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5715A951
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 13:40:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88794C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 12:40:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 141B9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 12:40:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CCCmOX032742; Wed, 12 Feb 2020 13:40:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5A21eCqK4ANCJIbIEW7y6mrEgC7B3UQ7rkutlKwvV/A=;
 b=Ba/49opsW7i7tSeNhlPadygjXRkwcc0RJv0GWJ9LSKGQicWkRuk7KyM97wO9jumSHuf8
 i3EWw8WiQkBzI6zsW5HYK24QaFs4RuQGsUXT9KXNirPSP2KMF/Gv65PQhf6by/RDFkyj
 N0prage0zh5i4d/kQrK1u4w55kda3lPQsz5Oo5S0TrEtcbWxq7BpyreVhVR6jgzgIpQe
 zU441HQTpQS80OrDI9MncMf3fxLSt4ngoCD+CvT0nIE1H3dgrpOqZSLnX4nxrg3e0yyj
 O2nQhNHzpDnt3BLEUniqfJ6fW4a3X/bSApZ0T3tdZCXORkQ8nTy1EgGZCJy0HK7Q2//F xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9x7u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 13:40:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBAD8100038;
 Wed, 12 Feb 2020 13:40:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E302A2B1867;
 Wed, 12 Feb 2020 13:40:07 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 13:40:07 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 13:39:59 +0100
Message-ID: <20200212124001.12788-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212124001.12788-1-patrick.delaunay@st.com>
References: <20200212124001.12788-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_06:2020-02-11,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 6/7] configs: sandbox: Enable sub command
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

Changes in v3: None
Changes in v2:
- activate env info command in sandbox (new)

 configs/sandbox64_defconfig        | 1 +
 configs/sandbox_defconfig          | 1 +
 configs/sandbox_flattree_defconfig | 1 +
 configs/sandbox_spl_defconfig      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 941b1fd2c7..cdcb0acbdc 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -27,6 +27,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 7b02b8de7c..33a103edab 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -31,6 +31,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
 CONFIG_CMD_ENV_CALLBACK=y
 CONFIG_CMD_ENV_FLAGS=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 0049da3d48..2bfbb66453 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -22,6 +22,7 @@ CONFIG_CMD_BOOTZ=y
 # CONFIG_CMD_ELF is not set
 CONFIG_CMD_ASKENV=y
 CONFIG_CMD_GREPENV=y
+CONFIG_CMD_NVEDIT_INFO=y
 CONFIG_LOOPW=y
 CONFIG_CMD_MD5SUM=y
 CONFIG_CMD_MEMINFO=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index f55692c2b5..3bf27c974a 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -33,6 +33,7 @@ CONFIG_CMD_ASKENV=y
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
