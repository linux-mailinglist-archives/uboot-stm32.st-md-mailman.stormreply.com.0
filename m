Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB959284B42
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Oct 2020 14:00:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8162C36B37;
	Tue,  6 Oct 2020 12:00:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E57D1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 12:00:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 096BwJYq011661; Tue, 6 Oct 2020 13:59:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vZrL4fm4cMYJD+bmWVGHGPV3yfO+H/h+5t4aVAUN7e8=;
 b=nppEjZfo0xZPNU4uwpVOPIB/1fFDxkmJ+dNDCfZ/jKghzJiXOngbeQnuFzRDal6zONmM
 JCt0IOKS/VBZa88qpMHK+Dytjz2gbtRa3MDoUA7qKwz/mXsXz9He60/YmdORG9oDHwOm
 EiD0ZlfTn8wHGYdnfWvL1qVtKigflddgi1sxW6DpIoRGMBUYHQVHIsS0pFW17lk9PCzT
 sdudhHM74aa7NxEcPTwDHrsd4/R69wRyAu2cQWjqIeh0blQ/lajve2/tWJjbPlR95uiw
 aqy9qoTVmsgPVPCWNU1QSSRcbBUb8SEf6Rs+fHVaqctSMQluiEi5Rx61JbleJwHQJoCl +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjecqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 13:59:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE18510002A;
 Tue,  6 Oct 2020 13:59:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A25A32AD2D4;
 Tue,  6 Oct 2020 13:59:52 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct 2020 13:59:51
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Oct 2020 13:59:41 +0200
Message-ID: <20201006115941.19533-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_03:2020-10-06,
 2020-10-06 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Robert Marko <robert.marko@sartura.hr>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Add stm32 and stm regexp for ARM
	STM STM32MP platform
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

Add files and directories regex "stm32" and "stm" in "ARM STM STM32MP"
platform to avoid missing files or drivers supported by the
STMicroelectronics series STM32MP15x.

This patch adds the rules already used in Linux kernel for
ARM/STM32 ARCHITECTURE.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8628ffd2a3..b275f3d45b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -444,6 +444,8 @@ F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
 F:	include/dt-bindings/reset/stm32mp1-resets.h
 F:	include/stm32_rcc.h
 F:	tools/stm32image.c
+N:	stm
+N:	stm32
 
 
 ARM STM STV0991
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
