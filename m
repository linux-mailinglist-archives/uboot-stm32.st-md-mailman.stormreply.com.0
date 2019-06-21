Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378C4E960
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:38:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15598CA75B2
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:38:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5FC4CA75B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:38:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDWmSm002860; Fri, 21 Jun 2019 15:38:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RSeFxNqUvzC4zq7H7fqop7iutq763KJyB/SNhu6syPE=;
 b=fewcmjvQ14NapzFs+HTRFYqPu4kkLifo/hxQUNSIcKwQYIEY3eFtng+R65+1sI7Wx/KZ
 RrwrQGxFIz2c2XstKx9yeTDYa05DAIDscqNM8jUJ2Zum/TD0XcjZQged8c9JiLEnv+hw
 aGxAUs/eEv1xU82b5vH7GVNe4mP2itcNEpMbATa59Ez+3QWUs/sV7f5DcPF2VCNMo1aU
 2qzUKlSLcxImpqSdMNh/V4UeKxIJX/BaomLU4p8DgffWNhz7m+I9PFz5sRBEfr5rGEhe
 JBkvA65jILGaA/EGAj9a1qmsHvjAYRFn1t6tq/jKA8VxZxqgRm0GcVoCc4UiSz9Ot6W9 Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qfv0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:38:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A3103A;
 Fri, 21 Jun 2019 13:38:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2931F2A80;
 Fri, 21 Jun 2019 13:38:13 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:38:12 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:38:10 +0200
Message-ID: <20190621133811.8216-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133811.8216-1-patrice.chotard@st.com>
References: <20190621133811.8216-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: Add u-boot,
	dm-pre-reloc for usart1_pins_a for stm32f769-disco
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

This allow to get console output in SPL for stm32f769-disco.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index 53a645dace..209a82c9cf 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -152,6 +152,16 @@
 			slew-rate = <2>;
 		};
 	};
+
+	usart1_pins_a: usart1@0	{
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+		};
+	};
 };
 
 &qspi {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
