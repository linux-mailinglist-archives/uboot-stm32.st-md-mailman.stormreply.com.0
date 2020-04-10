Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D603C1A4785
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:35:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1409C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 14:35:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FC28C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 14:35:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03AESH0v027092; Fri, 10 Apr 2020 16:34:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z7FrEUVVVOOgz8HhY2UVyFUWO8NfNMWSVEdA5UfTrGw=;
 b=GtfmZIJkAtKZgLQ92a2HXZoEtnVLObpTaF/dVIp6N+/Z7n3rpbh8KEwvCD/G616a/oQX
 D4Xnfv/NXuTimAHxwDU0AmlaF466d5cYoPskEr7v+0LhYbJEyIM2+oPw0m3fl6fDJOGB
 Ss0a0cLwWF1h06AON3osIgnAgYRN3Wwsce0Stgye52NFVGzqnkMEVJKP9iL5f9Y3EtZq
 1ETj90Va+o4nsB2JHe0TaqPqHXCEK/SfC/bBYS69+NJWKuZPL25ITCj0aEimufQfVVfC
 fqx0ZLYrtUx6Nq5zloHeBf5rekGTFGwc14F5dRvFR1sHnfFXMymT/0MdbNUz6VA+dcYp vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091k78xjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 16:34:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A44F4100039;
 Fri, 10 Apr 2020 16:34:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B8D92BF9C6;
 Fri, 10 Apr 2020 16:34:48 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 16:34:47 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 16:34:42 +0200
Message-ID: <20200410163403.3.I2f2c3584fe42d6c42910d2e7e40d236910365a89@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Pascal Linder <pascal.linder@edu.hefr.ch>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/3] rmobile: rcar: removed used
	CONFIG_SYS_RCAR_I2C*_BASE
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

As this "CONFIG" are never used, CONFIG_SYS_RCAR_I2C*_BASE can
be removed without effect and the file config_whitelist.txt is
also clean-up.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-rmobile/include/mach/rcar-base.h | 6 ------
 scripts/config_whitelist.txt                   | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/arm/mach-rmobile/include/mach/rcar-base.h b/arch/arm/mach-rmobile/include/mach/rcar-base.h
index a20740679f..811a1183ba 100644
--- a/arch/arm/mach-rmobile/include/mach/rcar-base.h
+++ b/arch/arm/mach-rmobile/include/mach/rcar-base.h
@@ -78,12 +78,6 @@
 #define CONFIG_SYS_I2C_SH_BASE0	0xE6500000
 #define CONFIG_SYS_I2C_SH_BASE1	0xE6510000
 
-/* RCAR-I2C */
-#define CONFIG_SYS_RCAR_I2C0_BASE	0xE6508000
-#define CONFIG_SYS_RCAR_I2C1_BASE	0xE6518000
-#define CONFIG_SYS_RCAR_I2C2_BASE	0xE6530000
-#define CONFIG_SYS_RCAR_I2C3_BASE	0xE6540000
-
 /* SDHI */
 #define CONFIG_SYS_SH_SDHI0_BASE	0xEE100000
 
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 0f747ac0a3..0f9d8cb0d7 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -3668,10 +3668,6 @@ CONFIG_SYS_QRIO_BR_PRELIM
 CONFIG_SYS_QRIO_OR_PRELIM
 CONFIG_SYS_R7780MP_OLD_FLASH
 CONFIG_SYS_RAMBOOT
-CONFIG_SYS_RCAR_I2C0_BASE
-CONFIG_SYS_RCAR_I2C1_BASE
-CONFIG_SYS_RCAR_I2C2_BASE
-CONFIG_SYS_RCAR_I2C3_BASE
 CONFIG_SYS_RCWH_PCIHOST
 CONFIG_SYS_READ_SPD
 CONFIG_SYS_RESET_ADDR
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
