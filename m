Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E376E1B4523
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8741C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B35C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCNqn015755; Wed, 22 Apr 2020 14:29:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AVl/QyxMd8oC1wGX0Mr2WX/Jzu6VS1pJjGcLIvl/jwc=;
 b=meaSWMxizbp2Bp6LK82mZ0NRkRB5/49YEx/JBadJEQKsPFhwlbQHneCKSRk7qYvwewzv
 roWQzjxcXn7OIDTbtLF7pa1oRCXmwHzqY0l2fo/3m5ymvhNTYxKByBz3krZYAOc2tRaq
 wh0X8ng7pL8ZQB//tDmEfacP4P1GeGRu4pbPwT0UxLG0otIhBlnRPbDxdfUkEixvYKgV
 Q7N7tpqLdaf1ITZh00xOWdF1UzFbM2FXAt9xz4+4guw6WSO/YV9AeHJ6+nG5F4KuRuSd
 LfGCMLJuZyEK55J45SlaXJAeP6M9dkV9XE/0GwQ4/A24KeaX83ueVgzborBKf3xK3eDC 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregpatx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D2F1100034;
 Wed, 22 Apr 2020 14:29:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 340FE2AE6C5;
 Wed, 22 Apr 2020 14:29:27 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:26 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:15 +0200
Message-ID: <20200422142834.v2.7.Ic051e25812481db408f2431c7962da1db1f198fb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/12] board: stm32mp1: remove bootdelay
	configuration for usb or serial boot
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

It is not allowed to change the user setting of bootdelay, so
remove the check of the boot-source to disable it dynamically
in board_late_init()


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- remove bootdelay configuration after Wolfgang's comment on dropped patch
  [11/16] board: stm32mp1: check env_get result in board_late_init

 board/st/stm32mp1/stm32mp1.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 280c5b7ae4..687d605e29 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -692,7 +692,6 @@ int board_init(void)
 
 int board_late_init(void)
 {
-	char *boot_device;
 #ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
 	const void *fdt_compat;
 	int fdt_compat_len;
@@ -740,11 +739,6 @@ int board_late_init(void)
 	board_check_usb_power();
 #endif /* CONFIG_ADC */
 
-	/* Check the boot-source to disable bootdelay */
-	boot_device = env_get("boot_device");
-	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
-		env_set("bootdelay", "0");
-
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
