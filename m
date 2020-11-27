Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF532C6361
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:49:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADFFFC56630;
	Fri, 27 Nov 2020 10:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB26AC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:49:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAgKZG000938; Fri, 27 Nov 2020 11:49:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=c9YSnBUG9oSa9FMQEijrRqmj7dNaZh/7t+b2bAUohAA=;
 b=P/v49bWXrmTdKABXA7dTkQHASANeSNVmqEK68PrrXdavLLzptIWofCRAjbnXeKtzAlNw
 iTmRnXio8TH5QuXCcRYRz+xtgcykne4mtMfjq7lDlaw26QeYKjDFPj7UsOTjLCe0mCyG
 UW5+PcRiQ+lr3CWBvHHVhQGomnIPkA0KBx8Qc+E7890GtpSF4zeusDhrtbe3dXnJQqoK
 7FukjYgoAVOnh7xpzLaHhiVJvJ7r3QnVVFTZmFKwMqQ65MovfdlxgP9kMo/iccK86+5R
 lObnBlqIlHfFCrvZQi0iDYDjsDAqzb4fYgClvnMp1ZBc7aaK/MLe1Oxx2UdblbF/PY6P rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01d22y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:49:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDD2B10002A;
 Fri, 27 Nov 2020 11:49:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E132323B151;
 Fri, 27 Nov 2020 11:49:37 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:49:37
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:49:29 +0100
Message-ID: <20201127104930.32692-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] configs: sandbox: activate DEBUG_UART
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

Add CONFIG_DEBUG_UART=y for all sandbox defconfig
as it is already done in sandbox_defconfig.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/sandbox64_defconfig        | 1 +
 configs/sandbox_flattree_defconfig | 1 +
 configs/sandbox_spl_defconfig      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index dc993cd13a..3bcf472a47 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -5,6 +5,7 @@ CONFIG_PRE_CON_BUF_ADDR=0x100000
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_DEFAULT_DEVICE_TREE="sandbox64"
 CONFIG_SANDBOX64=y
+CONFIG_DEBUG_UART=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 1f593eba8f..4ac72aa5ce 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -3,6 +3,7 @@ CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_DEBUG_UART=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 1ac843e1bc..e3b435837b 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL=y
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
 CONFIG_SANDBOX_SPL=y
+CONFIG_DEBUG_UART=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
