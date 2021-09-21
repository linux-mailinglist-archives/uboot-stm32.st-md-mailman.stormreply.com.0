Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42372413740
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 18:19:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B5AC5A4CC;
	Tue, 21 Sep 2021 16:19:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDE66C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 16:18:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LB9oZt008654; 
 Tue, 21 Sep 2021 18:18:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=aMSzY1aAmydrveUp1v1fHsyhiL51m5F1ntbZjAvsA3w=;
 b=JOGuVXeHV06xtUjHEXgAPfYjygJcY8lt3ma6KHCaAiqetkTHc3smW6gKaij9XvmbykVM
 wpZO/Z4zLQniq3PYw7lBsCjf3KovHX2XIjMNU8ukVAM16ssxwMJmTnptNtvkQWCv9d2s
 XWpWvDligiSw+VKsfl6ORTumR/xpqHvZRgT9O0ZOy+bRLGSHyxK2Cpv3OOhapnNw9f3H
 X3kZrlDeJC8YhRIuh78vcQ3L/ffpREiZdA+trAIgIIPkBEZDiPjBLjs8iwhGxtsbwoL+
 7mwn/NkZeCxY3OqxVo5/+aQHUn+5K8i1E1CQHHQgQypHqF+TWciOeDz7ag7lcdFqpRVO Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b798w34ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 18:18:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7390110002A;
 Tue, 21 Sep 2021 18:18:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60DCE234545;
 Tue, 21 Sep 2021 18:18:56 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep 2021 18:18:56
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Sep 2021 18:18:51 +0200
Message-ID: <20210921181848.1.I7649d2cbc9b43ca9aef6daa71bb76212a3ff9822@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_04,2021-09-20_01,2020-04-07_01
Cc: Vipin Kumar <vipin.kumar@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] MAINTAINERS: remove SPEAR entry
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

As the lastest spear directories are removed, delete the associated entry
in the MAINTAINERS file:
- arch/arm/cpu/arm926ejs/spear/
- arch/arm/include/asm/arch-spear/

Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8693f877..70931e25a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -412,13 +412,6 @@ F:	include/dt-bindings/clock/stih407-clks.h
 F:	include/dt-bindings/clock/stih410-clks.h
 F:	include/dt-bindings/reset/stih407-resets.h
 
-ARM STM SPEAR
-#M:	Vipin Kumar <vipin.kumar@st.com>
-S:	Orphaned (Since 2016-02)
-T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
-F:	arch/arm/cpu/arm926ejs/spear/
-F:	arch/arm/include/asm/arch-spear/
-
 ARM STM STM32MP
 M:	Patrick Delaunay <patrick.delaunay@foss.st.com>
 M:	Patrice Chotard <patrice.chotard@foss.st.com>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
