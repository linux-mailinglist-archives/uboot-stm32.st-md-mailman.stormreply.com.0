Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D15671A5
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Jul 2022 16:57:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1997C640F7;
	Tue,  5 Jul 2022 14:57:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 567DBC640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 14:57:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265CCArq019231;
 Tue, 5 Jul 2022 16:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=khp+eiyV+MxBzWyUAJ2icAQeTgYnPmJPgYxDDGaLMfk=;
 b=RLoMgDHPSSiIzX6JDBBdF7walwSmSYglL2u5Dy9TQjiBvtlyHPSvVDTpQluP4FsVAcA1
 VA/tNhS9quwL41UB2zgWaHGuw2xDqdGb198e7Z4KSTiCIyGuigYSkVblLS9eXh3eJAac
 06eiZ4j1ymYbfO4DahmsfJL8mCcQJRE8LGUyW8gC7hdRqDzEtiw0L57mQYNOZOS/wsu+
 +S6WqQe1tQOjocotuvGbcPJxxtJax9a2XzKx2m3yWCSx1qu8LOB51TPQjWgBz425y1Rv
 cCdX101rtXDb5RAOnUtwlZEPJrlQQDmcbfHXNTEFXkkzTacYAlZUVXh7qsA4jTybyhr0 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4n3ms2gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 16:57:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8939A10003A;
 Tue,  5 Jul 2022 16:57:16 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E25A22789D;
 Tue,  5 Jul 2022 16:57:16 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 5 Jul
 2022 16:56:01 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 5 Jul 2022 16:55:55 +0200
Message-ID: <20220705165545.2.I0cf2d893e7ee711664e7586b9f7fb992caff06fa@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_11,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/4] clk: stm32: add support compatible st,
	stm32mp1-rcc-secure
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

Add support for new compatible st,stm32mp1-rcc-secure used when the
RCC resource is managed by secured world (RCC_TZCR.TZEN=1)
iand when SCMI is used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/misc/stm32_rcc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index b816503bfa2..c1e5428a6b8 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -84,6 +84,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
 	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_clk_f7 },
 	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_clk_h7 },
 	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_clk_mp1 },
+	{.compatible = "st,stm32mp1-rcc-secure", .data = (ulong)&stm32_rcc_clk_mp1 },
 	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_clk_mp13 },
 	{ }
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
