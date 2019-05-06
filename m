Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9D14766
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 11:17:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DD81C9AE54
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 09:17:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85680C9AE45
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 09:17:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469GMdL004466; Mon, 6 May 2019 11:17:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jnlBx++cFcUAAO2dV88lyBdVxLbFPJZqqFr4fR1hkmY=;
 b=gVskeicZ1JwU6I72mSA2N744eu2Py4eBKLpN0SJ5a4ObJhoQpWhLAA61iMVB7YtGMD3M
 TVKyPgwK2cfJTznZpAKlHdL5hFB6GjE2sO0Dk+zbFMABFl932+6VjxbHXnN/+s5EEOis
 vX/qgnrvlS9FCzF/ogVSRuFdKHUlBOKV5NEP2RtlDX9RmhsxTlzDoqcd0yiZfudTHgZK
 18oaB9HjMkNl9I6nOtRGaW+RUpVpL5qE97TvvqFxH4PBdA1CNVFPLoYhcuLFNwDxsQmT
 y1ScJbdMp5WMh+1W3dQpYi1j8K1UPjOagvQzkRuCIBBbkyAP8ka1x4XRKVxRysFgmbCi qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s94bvgebc-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 11:17:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 441E531;
 Mon,  6 May 2019 09:17:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E7CA15C7;
 Mon,  6 May 2019 09:17:17 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 6 May 2019 11:17:16 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 May 2019 11:17:02 +0200
Message-ID: <1557134223-4549-12-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
References: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/12] configs: stm32f469-disco: Enable QSPI
	relative flags
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

Enable CMD_SF, MTD, DM_SPI_FLASH, SPI_FLASH, SPI, DM_SPI and
STM32_QSPI flags to be able to use the embedded n25q128a QSPI flash
on stm32f469-disco board.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stm32f469-discovery_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index 377f19b..174f807 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -16,6 +16,7 @@ CONFIG_CMD_IMLS=y
 CONFIG_CMD_GPT=y
 # CONFIG_RANDOM_UUID is not set
 CONFIG_CMD_MMC=y
+CONFIG_CMD_SF=y
 # CONFIG_CMD_SETEXPR is not set
 # CONFIG_CMD_MII is not set
 CONFIG_CMD_CACHE=y
@@ -25,4 +26,11 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32f469-disco"
 CONFIG_DM_MMC=y
 CONFIG_ARM_PL180_MMCI=y
+CONFIG_MTD=y
 CONFIG_MTD_NOR_FLASH=y
+CONFIG_DM_SPI_FLASH=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI=y
+CONFIG_DM_SPI=y
+CONFIG_STM32_QSPI=y
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
