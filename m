Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533DC7AF7B
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBEC0C35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEB12C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGSAQ001302; Tue, 30 Jul 2019 19:17:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OPJblAalzzb3KI5n7WPUCUXjEzr5P+mxxXtebjLF+u0=;
 b=XqOi5+21c/EOEqMpHJcGx4qGJ3l5kyK3bRlO+AHDQLcQlVTxZ2u/1YLu9XZXBgWcRmv2
 61cyPXqjl/vA+ZdrODl88ch5l3KXxk5cMNCGsyzbb6aIXcL/YKW2Vn+er0RIFedR58a2
 rQ6jPxfTXVSp4Mg3MSH4aNKgJWwWuwRxlJI5VAQE9boJl1oFMxzh6oBlDMF4MnB1WlOh
 ei7YvthRwTEhzC67xCEbbH7eyJrKQO3FT9VeIKgQS6bVBkNPX2ZLyng2Cp1F3rLQumk/
 0Len4yaI7kHyXw3nGscMCaG0Ixxj5uX/iZR6qh4b0TgkomsYZBxKXSXzobfQH4HJ5ZV6 cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0ccwkf83-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C86834;
 Tue, 30 Jul 2019 17:17:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AFC829B3;
 Tue, 30 Jul 2019 17:17:11 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:11 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:10
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:18 +0200
Message-ID: <1564507016-16570-11-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 10/48] ARM: dts: stm32mp1: add pull-up on
	serial rx of console connected to STLINK
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

Avoid U-Boot auto-boot interruption for line break detection
on console when the RX line connected to STLINK is floating
(-IO error in getc cause by framing error and testc return 1)
Same workaround is applied on all the STMicroelectonics board.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 ++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 2a1cfd3..dcaab3e 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -189,6 +189,8 @@
 	};
 	pins2 {
 		u-boot,dm-pre-reloc;
+		/* pull-up on rx to avoid floating level */
+		bias-pull-up;
 	};
 };
 
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 200601e..21c89c1 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -206,5 +206,7 @@
 	};
 	pins2 {
 		u-boot,dm-pre-reloc;
+		/* pull-up on rx to avoid floating level */
+		bias-pull-up;
 	};
 };
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
