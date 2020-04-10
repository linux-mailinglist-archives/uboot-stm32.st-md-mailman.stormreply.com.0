Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA31A4781
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:34:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 963DFC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 14:34:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4C1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 14:34:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AERIY3027725; Fri, 10 Apr 2020 16:34:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GdBAxIDaGf5eWXfnUROpLqI4c2mF9uuBOQDtGUClwx8=;
 b=DRfdDaBQH24R4NMoVJaSsBB5SiLpJWjPLgCXYsz27L4vav0JrqW8lQJpX5ELC+wahI9r
 dO6iNNFNztZlnGfnhxrl1ENpJ+KuFnQjd2nUtnrhUe0znMT6upe6ESFY0Bcs/AnSqlLG
 0/pAsU41t1RUY+xLQ/5urhGOak0GFD4uBTiAvA0hLzNjwMxxiu0JsMobp5cIuEYnoKm4
 +1fi57WAR9E3PALjbneHP4KwM6rldISXUeQzIdg6Zz7Yl/5yPcRug7UwBNp+rWKwTWop
 SLA+2cZt64c33Eagcw5e5i1Da0ehzKCIHxMvDoZBlJBfKZm1dvOEgMdfH3d55jqh6Rdi nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkgweh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 16:34:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96339100038;
 Fri, 10 Apr 2020 16:34:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 854B52BF9C6;
 Fri, 10 Apr 2020 16:34:47 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 16:34:46 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 16:34:41 +0200
Message-ID: <20200410163403.2.Ice5c9d8cd5de91bb8b2f0db60c93e5be3d921893@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH 2/3] README: remove references on no more used
	config CONFIG_SYS_RCAR_I2C*
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

Remove the references in README on CONFIG_SYS_RCAR_I2C_* not use
in U-Boot drivers/i2c/rcar_i2c.c, since commit a4d9aafadb31 ("i2c:
 rcar_i2c: Remove the driver") and commit a06a0ac36d59 ("i2c: rcar_i2c:
 Add DM and DT capable I2C driver")

Checked by the command: grep -r SYS_RCAR_I2C *
And these CONFIG are only defined in
arch/arm/mach-rmobile/include/mach/rcar-base.h

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 README | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/README b/README
index 6cb7656fa0..3cc99f0805 100644
--- a/README
+++ b/README
@@ -1632,16 +1632,6 @@ The following options need to be configured:
 		  - activate this driver with CONFIG_SYS_I2C_RCAR
 		  - This driver adds 4 i2c buses
 
-		  - CONFIG_SYS_RCAR_I2C0_BASE for setting the register channel 0
-		  - CONFIG_SYS_RCAR_I2C0_SPEED for for the speed channel 0
-		  - CONFIG_SYS_RCAR_I2C1_BASE for setting the register channel 1
-		  - CONFIG_SYS_RCAR_I2C1_SPEED for for the speed channel 1
-		  - CONFIG_SYS_RCAR_I2C2_BASE for setting the register channel 2
-		  - CONFIG_SYS_RCAR_I2C2_SPEED for for the speed channel 2
-		  - CONFIG_SYS_RCAR_I2C3_BASE for setting the register channel 3
-		  - CONFIG_SYS_RCAR_I2C3_SPEED for for the speed channel 3
-		  - CONFIG_SYS_RCAR_I2C_NUM_CONTROLLERS for number of i2c buses
-
 		- drivers/i2c/sh_i2c.c:
 		  - activate this driver with CONFIG_SYS_I2C_SH
 		  - This driver adds from 2 to 5 i2c buses
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
