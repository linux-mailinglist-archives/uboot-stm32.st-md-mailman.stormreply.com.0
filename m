Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46B46B6A2
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Dec 2021 10:06:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB40C5F1E7;
	Tue,  7 Dec 2021 09:06:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A22A1C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 09:06:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B74Aakw019519;
 Tue, 7 Dec 2021 10:06:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ngxzyUx4NpPKQl5BRfKytbWWt1R2FVumN7cR0JMSJfM=;
 b=k+irmwa0RglC1zWVBONE/wqtOHwdADqHbA0Fp7niNgHJaYOM6vRfGvhd2KzRBxyLAJ99
 R8Ow3bM2FlyBcaOzhxKwUNqWXRWEDqKUvwe8kPtyJqzdMsljJ131HUwFEFuzhHMbgdQC
 4PcBa763PE1r3XqEMK3wqInAnYSETDGg5HPc3ki3cyVY1g0f3DR60hJiJQS4IsYx+3nw
 XkysrdTzL9+7kITRRrlDLHLwjL9yN8UqyV/5VPoReIgclKKKD4l5f4PUgnti5m9lRVGs
 tPgXlwLgrYb71a4M8ITjiK/MAvfQGRGsBAta/HqbhDDmHxrg7cgerjAFaMYUSwxyr0v2 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csp32bqde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:06:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCB6E100034;
 Tue,  7 Dec 2021 10:06:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4B45229A81;
 Tue,  7 Dec 2021 10:06:08 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 10:06:08
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Dec 2021 10:05:59 +0100
Message-ID: <20211207100549.2.I6347e4b7268b9a30a04d597cd467fbcf8defd684@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
References: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp: correct the dependency for
	bootcount configs
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

Default value for CONFIG_SYS_BOOTCOUNT_SINGLEWORD and
CONFIG_SYS_BOOTCOUNT_ADDR are only needed when
CONFIG_BOOTCOUNT_GENERIC is used.

This patch avoids to define these configs when an other bootcount backend
is activated, for example for CONFIG_BOOTCOUNT_ENV.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 2fa4ea4d5c..2819944df3 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -194,7 +194,7 @@ config PRE_CON_BUF_SZ
 config BOOTSTAGE_STASH_ADDR
 	default 0xC3000000
 
-if BOOTCOUNT_LIMIT
+if BOOTCOUNT_GENERIC
 config SYS_BOOTCOUNT_SINGLEWORD
 	default y
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
