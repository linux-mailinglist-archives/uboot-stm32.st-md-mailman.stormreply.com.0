Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2E2182D25
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 11:11:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92487C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Mar 2020 10:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 081C4C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 10:11:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CA2Pd1008841; Thu, 12 Mar 2020 11:11:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sXvkJ4dj5PJn4EiErSXCh6ZLHhPwS1PC+q/0U2BsqkM=;
 b=0FMuGy3F0vlTYcyg98QX6hVK7f5WTcGeRoOV5oc7lSb2fhEyBFAG6Ilre+m59bTy9Ccp
 HL/IX6wW6JkeHI0kibDs3DBRM5ayyVimri5eUrMZr7s3OJw+ONiiL0Jzuoq/Xbz4JV70
 rR2TfUBJsWtp8fYRhDZsrJn/bS4OKdj7s6FRqd5KObc65unR5wkDWoak49CORcAYdkzn
 NJ4iGQqpOmj3NEGYvR60zDyQLCaGr/uvSkSuQE3nmuTYYdcM/dzUkKGRCg7qfcr/+cDK
 eQStstSfa/eNbe8UtTN3ZwKz1FQ0yHZTxE9+mIbQXTsLAbkzooJVwZKPwEDFyI5UOmoh SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mh99rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 11:11:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F0CC100039;
 Thu, 12 Mar 2020 11:11:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB94C21F0DA;
 Thu, 12 Mar 2020 11:11:30 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 12 Mar 2020 11:11:30 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 12 Mar 2020 11:11:18 +0100
Message-ID: <20200312111114.1.Ib3afa8c50c18f3d86fb39f535864476f697b8ba7@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_01:2020-03-11,
 2020-03-12 signatures=0
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, "Andrew F. Davis" <afd@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: update entry for ARM STI
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

Add STi drivers/include files and git tree.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1842569f242d..1694cb13f264 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -328,8 +328,21 @@ F:	drivers/usb/host/ehci-msm.c
 ARM STI
 M:	Patrice Chotard <patrice.chotard@st.com>
 S:	Maintained
+T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
 F:	arch/arm/mach-sti/
 F:	arch/arm/include/asm/arch-sti*/
+F:	drivers/phy/sti_usb_phy.c
+F:	drivers/pinctrl/pinctrl-sti.c
+F:	drivers/mmc/sti_sdhci.c
+F:	drivers/reset/sti-reset.c
+F:	drivers/serial/serial_sti_asc.c
+F:	drivers/sysreset/sysreset_sti.c
+F:	drivers/timer/sti-timer.c
+F:	drivers/usb/host/dwc3-sti-glue.c
+F:	include/dwc3-sti-glue.h
+F:	include/dt-bindings/clock/stih407-clks.h
+F:	include/dt-bindings/clock/stih410-clks.h
+F:	include/dt-bindings/reset/stih407-resets.h
 
 ARM STM SPEAR
 #M:	Vipin Kumar <vipin.kumar@st.com>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
