Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE33960928
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EDFBC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AFC9C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FFoLc006731; Fri, 5 Jul 2019 17:20:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yHEYojBUxncs5SsUb2tG/fAnt6TFkKCZXAquVXZtgno=;
 b=m5egiiXykRumtHEwOlZiNW8w4D1RlNCnbepqeZWKDPn1kcAYQwR9+uPghQFRxm2oK8nK
 YNXaW9+efwpEqn1zuKW7EszGunAn3uLrRKstp66lt4yVcQcnWqZpz8Y7HJmPV7pqGgGy
 UZVEt6Q/obw5a2+TA1+Fz0cNWFptCV6u4Mrs8vVXZAxzDyOJya7HtI6AM/47yCAGXxSv
 pFEWR7LuaqO/awcgoiSxEMugRY2hhsTzdAG1jNX5D5qHuFqvXQCY/W6FbS+qGtU4OsrZ
 Y6SXuz6wBmbfT2td9Wyzh6QOuLipFgKMD9jcby2HxJOvPEvyFLH4F8qUqAPdWPeyyQv2 vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tgx0qy84e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83AB638;
 Fri,  5 Jul 2019 15:20:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 220AE4FBB;
 Fri,  5 Jul 2019 15:20:46 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:46 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:45
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:21 +0200
Message-ID: <1562340023-8516-15-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 14/16] stm32mp1: add check for presence of
	environment in boot device
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

For boot from flash, check presence of default environment to force
save env.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 include/configs/stm32mp1.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1d385e0..6c74b4b 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -112,6 +112,7 @@
 	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
 	"then stm32prog ${boot_device} ${boot_instance}; " \
 	"else " \
+		"run env_check;" \
 		"if test ${boot_device} = mmc;" \
 		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
 		"if test ${boot_device} = nand;" \
@@ -143,6 +144,9 @@
 	"ramdisk_addr_r=0xc4400000\0" \
 	"fdt_high=0xffffffff\0" \
 	"initrd_high=0xffffffff\0" \
+	"env_default=1\0"				\
+	"env_check=if test $env_default -eq 1;"\
+		" then env set env_default 0;env save;fi\0" \
 	STM32MP_BOOTCMD \
 	STM32MP_MTDPARTS \
 	BOOTENV
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
