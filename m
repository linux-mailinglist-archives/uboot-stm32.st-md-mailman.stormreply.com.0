Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901B14761
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 11:17:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A191C9AE47
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 May 2019 09:17:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AC88C9AE41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 09:17:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4692IlR009573; Mon, 6 May 2019 11:17:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iMGNaUqQ26PV9zQWnI7yBb2dFv3vGqmzKjNlCHHjz1Q=;
 b=wCbnkCHFUEKj7qHzhKJ8K0BYef0BZHI4ShOP0CpoyzeNEUAZj31F5f2+kHvO2Z/gcdGN
 Z1nD71IyvVLjyiJwXHgSFvzXC/RiBVrJvfGclG2BEM3Qe0f7l+S2uJRVPLPxep+XO/rA
 5qxpK4CEBlGhCvD99sWMxD49huY4a6yJEdoYXkN1OmwFFLYv3EweGVy+eFbbgxRb9x+U
 5sTf6wGEw/c4VM7U4z9uL9QBki6w3jeYEBdFQRsJN82G8FQ8bXIQjv0/oopPXaLsMW5I
 nk9CWWu5dmoErRSQkjaEX8HuAOdT1s9Yf1FKCMBrNcHnGmdNDR4Pn3dQftFwUjcKmb4x 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c38k2h-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 11:17:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFEB538;
 Mon,  6 May 2019 09:17:08 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D5FBF15BC;
 Mon,  6 May 2019 09:17:08 +0000 (GMT)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 6 May 2019 11:17:08 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 May 2019 11:16:52 +0200
Message-ID: <1557134223-4549-2-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
References: <1557134223-4549-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
Cc: Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>, Lokesh
 Vutla <lokeshvutla@ti.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH 01/12] mach-stm32: Add MPU region for spi-nor
	memory mapped region
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

The Quad-SPI interface is able to manage up to 256Mbytes Flash
memory starting from 0x90000000 to 0x9FFFFFFF in the memory
mapped mode.
Add a dedicated MPU region into stm32_region_config.

See application note AN4760 available at www.st.com

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/mach-stm32/soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-stm32/soc.c b/arch/arm/mach-stm32/soc.c
index 738305c..6ae31d3 100644
--- a/arch/arm/mach-stm32/soc.c
+++ b/arch/arm/mach-stm32/soc.c
@@ -21,6 +21,9 @@ int arch_cpu_init(void)
 		O_I_WB_RD_WR_ALLOC, REGION_16MB },
 #endif
 
+		{ 0x90000000, REGION_1, XN_DIS, PRIV_RW_USR_RW,
+		SHARED_WRITE_BUFFERED, REGION_256MB },
+
 #if defined(CONFIG_STM32F7) || defined(CONFIG_STM32H7)
 		{ 0xC0000000, REGION_0, XN_DIS, PRIV_RW_USR_RW,
 		O_I_WB_RD_WR_ALLOC, REGION_512MB },
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
