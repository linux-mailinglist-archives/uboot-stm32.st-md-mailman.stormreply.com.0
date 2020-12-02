Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94E2CC428
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 18:47:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A562C56635;
	Wed,  2 Dec 2020 17:47:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 797C8C06150
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 17:47:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2HhJXQ022812; Wed, 2 Dec 2020 18:47:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EWXo8pjdjzQpf8LG/IsUSFQedsO3Frv05lVlPCivm3E=;
 b=AhCkzjGcAzbuhUSfKZQeK9I7qBXGSBdDfkuQbwmw9fH0EM3lBtwIQX+akUnm1pR2sOxj
 SP9fLKcbCo6Qt62W7plSGHdNlCg5Jt3Ol2V65kvWzrhIdreqUNY+R9vZBWfEtDU0C6gn
 TayLZeXFpvSiA4+JL698ASRa3dMxB5etF08kGpDT2Rlv5zOKw5nxW/qlFlfrX5gT6NB3
 1IbqpgGI+ETsxl6wEmo7E4fgov6w9be5o3Eff3+Yp3xt7gKihF28sGEOswOedjy4fM/7
 FvbXr6WHZbMr2OZVCRZ/O1CbsysySQXw7t2Phgj3Y4xt3hAPYqbDqdoDwpITlFqt06hK ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3hcku0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 18:47:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A716100034;
 Wed,  2 Dec 2020 18:47:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40702247D32;
 Wed,  2 Dec 2020 18:47:38 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec 2020 18:47:37
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Dec 2020 18:47:29 +0100
Message-ID: <20201202174731.9503-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_10:2020-11-30,
 2020-12-02 signatures=0
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] MAINTAINERS: Update ARM STI and ARM
	STM STM32MP Arch maintainers emails
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

(no changes since v1)

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
