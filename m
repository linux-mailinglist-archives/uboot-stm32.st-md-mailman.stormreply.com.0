Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D191A0EE0
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:07:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D47EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 14:07:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D963C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 14:07:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037E3rGS023559; Tue, 7 Apr 2020 16:07:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uwLK8LG50AXNOO1qtXiWnrVARcW4RETeSam/WQxhTEw=;
 b=bEQmejUzGPFNcsMTodxA4EUO9CkPZ+8/5dr76jcN3dWFePWl+jlTVyIDy58CIlG/oXxK
 3rZegui9o8Tn25yxEV6LsZD11bY4fwZPY++bhR4rXZ6ZN4r5rVbM0mprcV+s6iHRWdbr
 B8M8ouB5COPj44MufLWH54thsNl2Eaj376llpYp0r0BE76rz51xxhr5LI9kz73zHpUUF
 27LzyWvLNKgmgHvifJuoobJGqJY4e5zVezstBdF0dMM2hNhXvS4+dauaew45SXkJcw1S
 Wmu4nY1MshZSDEXJNh/X68d84VxOQlaHCJlG77gSEFT9hInN9XhNa7pe+I3jf/GaA8GH Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306fq1ghdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 16:07:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83D5E10002A;
 Tue,  7 Apr 2020 16:07:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62D172AF59E;
 Tue,  7 Apr 2020 16:07:49 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 7 Apr 2020 16:07:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Apr 2020 16:07:46 +0200
Message-ID: <20200407160742.1.Iff22fd0c4f1e9a7fd23f632f06e6f13bef768c53@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_06:2020-04-07,
 2020-04-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Wolfgang Denk <wd@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: cleanup test on
	eth_env_set_enetaddr result
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

Remove the unnecessary inversion on the eth_env_set_enetaddr() result which
only make complex the code of setup_mac_address() and display an invalid
value in the associated pr_err.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index ea0bd94605..2a9b7c1987 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -491,8 +491,8 @@ __weak int setup_mac_address(void)
 		return -EINVAL;
 	}
 	pr_debug("OTP MAC address = %pM\n", enetaddr);
-	ret = !eth_env_set_enetaddr("ethaddr", enetaddr);
-	if (!ret)
+	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
+	if (ret)
 		pr_err("Failed to set mac address %pM from OTP: %d\n",
 		       enetaddr, ret);
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
