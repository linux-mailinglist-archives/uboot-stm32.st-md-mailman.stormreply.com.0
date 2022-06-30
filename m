Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A20935615B3
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 11:10:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68942C04000;
	Thu, 30 Jun 2022 09:10:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDFECC03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 09:10:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U5rs1i017886;
 Thu, 30 Jun 2022 11:10:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=rbSYDJS1jwU6TMlPlfMlFAbwe7Fi6QXVJo0DYqYgXu0=;
 b=q6Fpj5xqfaBuB6XTfOna5tczkqhZ3ahIb2NZrwu+ID9SysCQwWNH+rYK74CYZuR9wFHH
 QMp8x93Jz5NBpu6qtJclf+Uq2SnmPd9xZ8IsocOXH/biJP3eg88+TZBmRsNRSSZZnBoI
 IJ0pzpZvfuyNya+iw5FQQiGQHbna+jQ9BFwgzHFZKYjchXMS52Usuiwo0OoZFGfbYktW
 lOCgP1Uo+Tqxe7E/cQPvMihNjDSIDTT40DaeCfbsOupro/9Zanbt+NnU1k/mDA7Y1+bQ
 ZW79Jo7mydaWCp6h9309zm3/OoNKk6MiR+BLFV6wSxLDjeKh6QD7UeIcTLGm8euPzKfu xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h0kbxqu41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 11:10:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C58E5100038;
 Thu, 30 Jun 2022 11:10:43 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF63D214D18;
 Thu, 30 Jun 2022 11:10:43 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 11:09:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 11:09:41 +0200
Message-ID: <20220630110938.2.I32a23c3e933a9c38ac1407db2b5c7d54e01d58b1@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
References: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_05,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: cosmetic: reorder
	include files
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

Reorder include files in the U-Boot expected order.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/net/dwc_eth_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 0c2ba206056..97279839baf 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -34,6 +34,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <errno.h>
+#include <eth_phy.h>
 #include <log.h>
 #include <malloc.h>
 #include <memalign.h>
@@ -46,7 +47,6 @@
 #include <asm/cache.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
-#include <eth_phy.h>
 #ifdef CONFIG_ARCH_IMX8M
 #include <asm/arch/clock.h>
 #include <asm/mach-imx/sys_proto.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
