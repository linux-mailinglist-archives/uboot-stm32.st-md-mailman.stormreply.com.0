Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B52E9756
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jan 2021 15:34:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 371CEC56632;
	Mon,  4 Jan 2021 14:34:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D23EC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jan 2021 14:34:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104ERjbs032729; Mon, 4 Jan 2021 15:33:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=4C2x+iPHo+fpz3wBefOtFOCNA2EF398woI9lZKSKClc=;
 b=o7PsC37ZYXI1OuHeuvgLjamEGOTR7KAZt+FTVACNEOh/K0SV1sO3b1fr5FQ1bB1mBia8
 F9ju1vHLcUNB1K1/GXXT8uacIPZHjHqiGdDNV/Udd/dW9761FlnUSv7yWA+VZUnVZ7hQ
 RE9GIA8tdEqulQemr3/R3JMiK5fLrFPQecEGKle2lIbe4+VFhAEP0PKSCvb4FJUMVJS8
 H4KHypF6HhgdCZDGDW/X1S6GY+FzKGowJM7MUoDn5yG3wJ7b10v8TQWe4c72g6l+Qp5N
 x8SUtGov1/lTyVKin0XvX7G3qUIBdH4DVQOxZGIlx/Ow7JO0dNYkANqH70kPj2dheXJx 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35teuutusk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:33:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 225FF10002A;
 Mon,  4 Jan 2021 15:33:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 310DC2B4D09;
 Mon,  4 Jan 2021 15:33:38 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Jan 2021 15:33:37
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Jan 2021 15:33:28 +0100
Message-ID: <20210104153315.1.I3168dfa428bf48b85ecca07ef26eed5d2c0a494d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
Cc: Stefan Roese <sr@denx.de>, Andrii Anisov <andrii_anisov@epam.com>,
 Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Michael Walle <michael@walle.cc>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH] lib: cosmetic update of CONFIG_LIB_ELF
	description
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

Change 2 typo error in CONFIG_LIB_ELF description:
- Supoort => Support
- fir => for

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 lib/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 7673d2e4e0..cc89fb4d91 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -695,7 +695,7 @@ config LIB_DATE
 config LIB_ELF
 	bool
 	help
-	  Supoort basic elf loading/validating functions.
-	  This supports fir 32 bit and 64 bit versions.
+	  Support basic elf loading/validating functions.
+	  This supports for 32 bit and 64 bit versions.
 
 endmenu
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
