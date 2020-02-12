Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2815AFFA
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10B03C36B14
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAF3DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIWcHu015143; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rF5nrzmICN2pwWH98lby6dBaZqeJLS/ctWUwraWLhbw=;
 b=o/GvCTFkK1fLkzZmlRauaejGWDxXLbYpqjR6KK0CGbkn52k14h7P2K4O8zE9kPPcEG5/
 Y+jl1DbLHDJUdl6I8vk+Yh75vxg6IUoGRhPcitcyDP0nwsOn6dvY95OXcpbeG4PELwVW
 c1Ztw2fL1QRRAy0zaIsF2s911oTPWAGjbiLFQLyiDuLrSjKwQuPCWhFbumPY8G/Pv54Y
 gBbUUJXyKU0l7Z+lP7kWTlG9TIMFEsvg6rVbRsArYgP5PQnoyJlE1Br2/1dRq6X+0uKd
 2gxLEUh82HX/ADbW44rEHwQUR5VdVPuvJnqB0dG4MqWXPFVRbRRTeMaH13YY073jNM/i 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda03ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DA9610008B;
 Wed, 12 Feb 2020 19:37:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35F062C60AC;
 Wed, 12 Feb 2020 19:37:53 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:52 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:40 +0100
Message-ID: <20200212183744.5309-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/10] arm: stm32mp: improve the error message
	for smc
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

Add the SMC code and operation for trace on errors.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
index 7b9167c356..4ad14f963b 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
@@ -46,8 +46,8 @@ static inline u32 stm32_smc(u32 svc, u8 op, u32 data1, u32 data2, u32 *result)
 	arm_smccc_smc(svc, op, data1, data2, 0, 0, 0, 0, &res);
 
 	if (res.a0) {
-		pr_err("%s: Failed to exec in secure mode (err = %ld)\n",
-		       __func__, res.a0);
+		pr_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
+		       __func__, svc, op, res.a0);
 		return -EINVAL;
 	}
 	if (result)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
