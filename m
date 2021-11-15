Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 624354502A4
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 11:39:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECBDC5EC6C;
	Mon, 15 Nov 2021 10:39:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11BB3C5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 10:39:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF7WXT9010466;
 Mon, 15 Nov 2021 11:39:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lwyw2l590Uj5dO4EtTvukwbPAh2jnoK+dewNoNGNCwU=;
 b=g7JWnhW5YaB9JTu3P+3P2IB8S8xOcOPWS+2sHyFub9ppoFJZCh1MYmfPv0A2kwakEtdf
 zZKsD16hYnOv7AyugppgIDAzGYPQlxdjeDmzAi+YzRsPVlvo1pynRLvNsTIPmVTRJL3q
 WHzZtvFyJQlKiGhtDZS1YY+zrbt+Tw2cS6WDpBEv143HCiXz1ryTiwk3coxj3iaQePrq
 i1Pad6WNJAllVhyJe3sFUjkvmKT/L/djoV9oBD50yfpJ/o2RpmOvyuM2caAJ/jrO6RD9
 jSE/WseSRHhL1FJ+iabXKDgoBIllMfK1+elsK8WT5Q8ttCy9fKepH6HEhVHA7Q8zWpV0 YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cbk8j17gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:39:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CDFB100038;
 Mon, 15 Nov 2021 11:39:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74A6B229A80;
 Mon, 15 Nov 2021 11:39:27 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 11:39:27
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 11:39:19 +0100
Message-ID: <20211115103920.30149-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115103920.30149-1-patrice.chotard@foss.st.com>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-12_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 7/8] ARM: dts: stm32: Use lower-case hex for
	address for stm32f746g-eval-u-boot.dtsi
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

Replace upper-case hex with lower-case hex for address.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32746g-eval-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32746g-eval-u-boot.dtsi b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
index f2195a6c51..8550ef7863 100644
--- a/arch/arm/dts/stm32746g-eval-u-boot.dtsi
+++ b/arch/arm/dts/stm32746g-eval-u-boot.dtsi
@@ -177,7 +177,7 @@
 };
 
 &qspi {
-	reg = <0xA0001000 0x1000>, <0x90000000 0x4000000>;
+	reg = <0xa0001000 0x1000>, <0x90000000 0x4000000>;
 	qflash0: n25q512a@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
