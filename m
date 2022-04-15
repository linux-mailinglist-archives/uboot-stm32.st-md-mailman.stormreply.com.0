Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8EB502A7D
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Apr 2022 14:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E52DC5E2CC;
	Fri, 15 Apr 2022 12:43:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 163F1C5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 12:43:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8VY2n014647;
 Fri, 15 Apr 2022 14:43:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Crp3DGf6gCS/qeepMlvVZk80ucjjl2n5PsbdDEraSNM=;
 b=rkV69Y5mD6B2u1Dxz7AZxhRfffm70rjn1j+4IiA14H370DzmmUvhDsXKG0yniwSx9+EV
 1vUVpH7FAHOD51Z9cxBh7m5SSt6Kb89ZSYGv9HG8kNMyWneqVbWhUFv3Y6AHA0bt9aJh
 VVQQ/xntxJqwSjfixCqvGtj4E0673zsxIsM6IodOV7PTc39UMB1ls/6j0bOB5cOqcgjF
 Nj4/O+3gta/keKwkrOGtrESXx14Q/2U5zBnujUjNc7wDXkQqgQPDn7skFv+uaOUbQxGQ
 e4aDGnjNSSSXCgonOuSm6AaRn4KrdV0o1lFNQ4KPeDSbxEoEI4yaeRck0un94tixl7Jb jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb7gpu68a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 14:43:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E49A610002A;
 Fri, 15 Apr 2022 14:43:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA39C220FC5;
 Fri, 15 Apr 2022 14:43:35 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 14:43:35
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 15 Apr 2022 14:43:23 +0200
Message-ID: <20220415144321.1.Ic7fcf7558ba1c08e031b54acd7b9f3544addb1d8@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_04,2022-04-15_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32mp: skip ft_system_setup when the
	soc node is absent
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

The function ft_system_setup should don't return an error when the
/soc node is absent in the provided device tree but just skip the
updates.

This patch solves an issue when the U-Boot pytest is executed on board.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/fdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index 91330a68a4..b1a4b76566 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -260,6 +260,9 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	char name[SOC_NAME_SIZE];
 
 	soc = fdt_path_offset(blob, "/soc");
+	/* when absent, nothing to do */
+	if (soc == -FDT_ERR_NOTFOUND)
+		return 0;
 	if (soc < 0)
 		return soc;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
