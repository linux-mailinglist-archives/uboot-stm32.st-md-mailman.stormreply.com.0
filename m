Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D32CC3E0
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:31:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8631DC56636;
	Wed,  2 Dec 2020 17:31:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14855C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:22:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2HH3ee014051; Wed, 2 Dec 2020 18:22:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=4zB3IyCcnYxWb4zcPRBmQ6otvT+oSNjRW/mnrmCwsKI=;
 b=oohYKTNTPCL0wYUceLtEEiLlhsQxwDrbWjBAmqIAfbv2gkd0wHhQI2jr4Ol1YStrjBx2
 6Gj7T6whHPvldS8gQMJ0/mS0BPhOwjKIz4vtGygTEvDD3becWPZGJzYFCzmYkKUZI7SN
 kKBRZBN3ZkL2ACXuPy4AByhpONh/a+0A28pt0jiToE0BWgl75MYQZCXYN9HMVOAoqk+w
 hKla6oY87qW0WsBo+bSlF+qglG5YDc+SJjTzDMSP3Ljf+f3JCati8NnGzQZfy0i2hrly
 M1xIpMaAF15fC+egRf0dus74qbtB4vGLfeaw1kBReZIbNr0YW6p7yl6VRPnREENEzgYA mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e4n77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:22:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEC1C100038;
 Wed,  2 Dec 2020 18:22:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3EC7233FB7;
 Wed,  2 Dec 2020 18:22:09 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec 2020 18:21:20
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Dec 2020 18:21:09 +0100
Message-ID: <20201202172110.7809-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
X-Mailman-Approved-At: Wed, 02 Dec 2020 17:31:53 +0000
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sean Anderson <seanga2@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] MAINTAINERS: Update ARM STI and ARM STM
	STM32MP Arch maintainers emails
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

Update Patrick and my email address with the one dedicated to
upstream activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 874cf2c0e5..ed5d7c3ab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -385,7 +385,7 @@ F:	drivers/smem/msm_smem.c
 F:	drivers/usb/host/ehci-msm.c
 
 ARM STI
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 S:	Maintained
 T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 F:	arch/arm/mach-sti/
@@ -411,8 +411,8 @@ F:	arch/arm/cpu/arm926ejs/spear/
 F:	arch/arm/include/asm/arch-spear/
 
 ARM STM STM32MP
-M:	Patrick Delaunay <patrick.delaunay@st.com>
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 S:	Maintained
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
