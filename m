Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118E1FBBBC
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 18:30:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D900BC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 16:30:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A95AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 16:30:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GGMF2b015249; Tue, 16 Jun 2020 18:30:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=4yEqyP31RTnyiY4gnYkyF3ubn2sSilWCqVjcFrNsBX0=;
 b=lGePiTa/XDN1zof3TcKdzdUfIoiEHwfv6WCj3BBmg3xwpNqQfhAIbW+uepR8qPvua0Pb
 +8yYeSMqD04/jvX4Tr7/TRoc9Fwc+r3ZdY0I1WruWf6C9uJ/sfikt8mAf1ActQh0fP4t
 JRLQDyq6+OLzSxoxx3VzgT1sRwu0gn08hoj9uEms4gXqE1joRXXg3fDoj1up3j96BbVv
 dd6FtRbWKgJ5hxKN90wdSiJGbv0/78lDffihG0xGTSiWeRO0PndF7YuDu6SiDQ/jL6i6
 CDc2tDtDtk6TXXtJ0x6EE3rHpcnsvn8Sx2m2hF0/3PrmiJVZ9AfYwBwAodHo7hCau8IF GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mm91rg3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:30:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A71EB100034;
 Tue, 16 Jun 2020 18:30:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AE8D2CE521;
 Tue, 16 Jun 2020 18:30:33 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 18:30:33 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 18:30:27 +0200
Message-ID: <20200616183025.1.If8226d1def9705c94aa14c3d9cc8dac493ad4a5a@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_10:2020-06-16,
 2020-06-16 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: only support SD card after
	NOR in bootcmd_stm32mp
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

In the boot command used in ST boards, bootcmd_stm32mp, only support
the SD card as second stage, where is found the bootfs with DISTRO.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/configs/stm32mp1.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index f271b84a59..baaf2ff89c 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -123,7 +123,7 @@
  * for serial/usb: execute the stm32prog command
  * for mmc boot (eMMC, SD card), boot only on the same device
  * for nand or spi-nand boot, boot with on ubifs partition on UBI partition
- * for nor boot, use the default order
+ * for nor boot, use SD card = mmc0
  */
 #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
 	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
@@ -136,6 +136,8 @@
 		"if test ${boot_device} = nand ||" \
 		  " test ${boot_device} = spi-nand ;" \
 		"then env set boot_targets ubifs0; fi;" \
+		"if test ${boot_device} = nor;" \
+		"then env set boot_targets mmc0; fi;" \
 		"run distro_bootcmd;" \
 	"fi;\0"
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
