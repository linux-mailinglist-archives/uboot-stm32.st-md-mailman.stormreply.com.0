Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE249C83
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 10:59:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7573C9B437
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 08:59:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFFC1C9B435
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 08:59:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I8v8Rh002109; Tue, 18 Jun 2019 10:59:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PPJuDOH9LQeGAkJxKEEUOYk3KVslL0tNaRdKdWv8M6A=;
 b=YzN7CiRKAAb8E2rvJ/r+D871dBEY8G3ITUUy2M2n592FFbkqLbs0hr/l7iOMdLDyNIZO
 gS3funZCs45IBZgJlweEgZjzM1TyFSLpZdYqVqvFVK88zhprZYSVCFNrtfxKT/tRccNN
 PYdXiiGjALcvysIgLk00qD6ozKffW8hKvGzfa7wQhgnpfGmJ6YItGUrdu75s5b7vs43F
 qItxb+6IaRdopZWwblX1n/lVQKW39l/sG2ErDV96zePBWiZY5pg2fXCURhVGT6Db0cxm
 I/WxuTrjdai0MUwMpuFrLVXVwJDAlH0HYacREsgGH9/fTUDwoFwyAmUcjAuD4OzfK6Rj tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4qjhybs0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 10:59:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFC673A;
 Tue, 18 Jun 2019 08:59:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A95B148A;
 Tue, 18 Jun 2019 08:59:13 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Jun 2019 10:59:12 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Jun 2019 10:58:48 +0200
Message-ID: <20190618085848.6887-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_05:, , signatures=0
Cc: Alexander Graf <agraf@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Kerello <christophe.kerello@st.com>,
 Liviu Dudau <Liviu.Dudau@foss.arm.com>, Ramon Fried <ramon.fried@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Mario Six <mario.six@gdsys.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: Remove Christophe Kerello from
	STM32MP entry
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

Christophe will not have maintainer activities, so remove its name.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
---

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e26eda2c8..ca32d7e5e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,7 +295,6 @@ F:	arch/arm/include/asm/arch-spear/
 
 ARM STM STM32MP
 M:	Patrick Delaunay <patrick.delaunay@st.com>
-M:	Christophe Kerello <christophe.kerello@st.com>
 M:	Patrice Chotard <patrice.chotard@st.com>
 L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 S:	Maintained
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
