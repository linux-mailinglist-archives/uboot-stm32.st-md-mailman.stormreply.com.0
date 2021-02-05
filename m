Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF47310B68
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Feb 2021 13:54:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E65FC57B52;
	Fri,  5 Feb 2021 12:54:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9032C57B52
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 12:54:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115CS9JM020666; Fri, 5 Feb 2021 13:53:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=choc6jI/WHWVDQ4ngXvhfbUUnPXKvM58sDY6V8BGGq0=;
 b=TapbeYdxZh23bvDQpgqxmj2P5xyRr/FXA3OHg+f6uxeyxJsJSIBdrRuTzdoo1BTjyCyV
 +R2sUd0E/QTT8FVSD7HSign3I6xTJqUpHmOW3tkyny4UKxZAY/n4CQiVy24E0x9dMRnx
 EeaLaCNiihJNdbp6WIkrQdBrrLtgojCHuds5SQsMDhrffm5pGAt+Duc0A0fDLV/iMwQL
 KmoJAjvpFnNVZJ20V6P8w1YsRmWKlnzE/bfkNHymncLyfwss5SxFtdfBSFdzCEVh77i5
 EQhKwJooySSi2Uf570Pv0kkROhSHwyTVD8nwbfgKguQ3M3oTGBmHINqeZY+5SopmxLV1 JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0fsetm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 13:53:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3CBC10002A;
 Fri,  5 Feb 2021 13:53:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6886230A83;
 Fri,  5 Feb 2021 13:53:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 13:53:48
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Feb 2021 13:53:39 +0100
Message-ID: <20210205135332.8.I9e7089b60ce4ced76429882e8f19f549de7e11fb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH 8/8] arm: remove set_dacr/get_dacr functions
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

Remove the unused function set_dacr/get_dacr

Serie-cc: Ard Biesheuvel <ardb@kernel.org>
Serie-cc: R Sricharan <r.sricharan@ti.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/include/asm/system.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system.h
index 289b820a6d..11fceec4d2 100644
--- a/arch/arm/include/asm/system.h
+++ b/arch/arm/include/asm/system.h
@@ -397,20 +397,6 @@ static inline void set_cr(unsigned int val)
 	isb();
 }
 
-static inline unsigned int get_dacr(void)
-{
-	unsigned int val;
-	asm("mrc p15, 0, %0, c3, c0, 0	@ get DACR" : "=r" (val) : : "cc");
-	return val;
-}
-
-static inline void set_dacr(unsigned int val)
-{
-	asm volatile("mcr p15, 0, %0, c3, c0, 0	@ set DACR"
-	  : : "r" (val) : "cc");
-	isb();
-}
-
 #ifdef CONFIG_ARMV7_LPAE
 /* Long-Descriptor Translation Table Level 1/2 Bits */
 #define TTB_SECT_XN_MASK	(1ULL << 54)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
