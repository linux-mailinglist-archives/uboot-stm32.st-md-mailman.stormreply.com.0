Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CBC1896F7
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3A2DC36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32EBC36B0F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8Ilmc024193; Wed, 18 Mar 2020 09:25:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/D89a7uZznaN0Ds+aC86HV2j9czLh5EZ3buqviMgFlM=;
 b=CQQmQBPlR2nv4EQU5OD/RKV7ot/duXLYZJ2dSjNkb51wVVAGN6UqHUADXTxeZNH7lCag
 xkmhAqDmZPE4o3lfNEhI6SqQpRAgx+MBMB/u9gT/7QPEVP0AMjP+6VbfdE8iT5mVKvAk
 kwav1bhoxL8qGtzikk6TqkAaGbJDxP2CL+HW6A4ZdRtppJvmIvn4i5Z3YiXvdeP/iOkh
 M22iNQD1coEBYgZjWSsdtEdNeacdIxGgM6DSvHo8tgxPDEvzv0Hsnxaa9HYabiAtTZNP
 wIkiyucWKoOB9PXEM9DljFS2gg1cCAFcZb7skDeFdZdn1IVLf98Lw+m1OBWjSrsWoO34 yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4w9t90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB427100038;
 Wed, 18 Mar 2020 09:25:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5E8521CA95;
 Wed, 18 Mar 2020 09:25:23 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:25:02 +0100
Message-ID: <20200318082503.8025-18-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 17/18] stm32mp: stm32prog: support for script
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

Support an U-Boot script included in uimage instead of flashlayout file
(text file in tsv format).

This feature is used to execute this script directly when U-Boot is
loaded in DDR (for update without STM32CubeProgrammer for example).

A simple example with dfu-util only is:

$> echo "dfu 0" > script.cmd
$> mkimage -C none -A arm -T script -d script.cmd script.uimg
$> mkimage -T stm32image -a 0xC0000000 -e 0xC0000000 -d script.uimg \
  script.stm32

$> dfu-util -d 0483:df11 -a 1 -D tf-a.stm32
$> dfu-util -d 0483:df11 -a 0 -D script.stm32
$> dfu-util -d 0483:df11 -a 0 -D u-boot.stm32
$> dfu-util -d 0483:df11 -a 0 -e

Then you can used dfu-utils to update your device

To increase speed, you can also switch to fastboot protocol with:
  echo "fastboot 0" > script.cmd

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 15bbdc2cb6..baf9b6bd1e 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <command.h>
 #include <dfu.h>
+#include <image.h>
 #include <asm/arch/stm32prog.h>
 #include "stm32prog.h"
 
@@ -44,6 +45,7 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
 	int dev, ret;
 	enum stm32prog_link_t link = LINK_UNDEFINED;
 	bool reset = false;
+	struct image_header_s header;
 	struct stm32prog_data *data;
 
 	if (argc < 3 ||  argc > 5)
@@ -71,6 +73,18 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
 	if (argc > 4)
 		size = simple_strtoul(argv[4], NULL, 16);
 
+	/* check STM32IMAGE presence */
+	if (size == 0 &&
+	    !stm32prog_header_check((struct raw_header_s *)addr, &header)) {
+		size = header.image_length + BL_HEADER_SIZE;
+
+		/* uImage detected in STM32IMAGE, execute the script */
+		if (IMAGE_FORMAT_LEGACY ==
+		    genimg_get_format((void *)(addr + BL_HEADER_SIZE)))
+			return image_source_script(addr + BL_HEADER_SIZE,
+						   "script@1");
+	}
+
 	enable_vidconsole();
 
 	data = (struct stm32prog_data *)malloc(sizeof(*data));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
