Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB13879A1
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71B0EC59790;
	Tue, 18 May 2021 13:12:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 303B5C5978A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDBpIT025600; Tue, 18 May 2021 15:12:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=1Az1RAtbp9zbjbq9fnA2l5gyYddSTejyWTf0Eex9QyE=;
 b=jB+Gdz3uxcnWbOxGhENPkhY3U0rl29cLNVCTI91qK4nd3zIXqgwchbcootlUOSEXxzZK
 f6Z061ygKOI/dsanCDMMOSNYHF5qAFaOKbl9tU5YQ4/46HxpOKZ6rVcdjeU4RbyoNaxc
 mkvyfIcwVe0u7urpWtJnByJUWPSojzkDr092Wdaly9+kDs/F+Y+pjBOZO7mUR7OvKne1
 DbGXb40PkgsyNbKW89uVf9CG4Imz6emJJmiNma3GLdnFnXLUTUE9cSm5KIS2y6Wy0W8u
 6vS4ZzsPp7USneRirTw5GIPNvDWAzL1z0IQaMr6xErl/Ffk3LPrXD1w215MxDvdDvshL Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38m4673ewx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36C23100039;
 Tue, 18 May 2021 15:12:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D5532275E0;
 Tue, 18 May 2021 15:12:25 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:24
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:10 +0200
Message-ID: <20210518151206.7.I874b9d67ab66c4a1b44c880721f697effa226c5b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/10] stm32mp: stm32prog: use get_cpu_dev for
	GetID command
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

Use get_cpu_dev() in uart getID command and remove the defines
DEVICE_ID_BYTE1 and 2 defines.

This patch prepare the support for new SOC family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 2550ae6a2b..7de62668fe 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -10,6 +10,7 @@
 #include <malloc.h>
 #include <serial.h>
 #include <watchdog.h>
+#include <asm/arch/sys_proto.h>
 #include <dm/lists.h>
 #include <dm/device-internal.h>
 #include <linux/delay.h>
@@ -19,8 +20,7 @@
 /* - configuration part -----------------------------*/
 #define USART_BL_VERSION	0x40	/* USART bootloader version V4.0*/
 #define UBOOT_BL_VERSION	0x03	/* bootloader version V0.3*/
-#define DEVICE_ID_BYTE1		0x05	/* MSB byte of device ID*/
-#define DEVICE_ID_BYTE2		0x00	/* LSB byte of device ID*/
+
 #define USART_RAM_BUFFER_SIZE	256	/* Size of USART_RAM_Buf buffer*/
 
 /* - Commands -----------------------------*/
@@ -436,10 +436,12 @@ static void get_version_command(struct stm32prog_data *data)
  */
 static void get_id_command(struct stm32prog_data *data)
 {
+	u32 cpu = get_cpu_dev();
+
 	/* Send Device IDCode */
 	stm32prog_serial_putc(0x1);
-	stm32prog_serial_putc(DEVICE_ID_BYTE1);
-	stm32prog_serial_putc(DEVICE_ID_BYTE2);
+	stm32prog_serial_putc((cpu >> 8) & 0xFF);
+	stm32prog_serial_putc(cpu & 0xFF);
 	stm32prog_serial_result(ACK_BYTE);
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
