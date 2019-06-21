Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5E4E961
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:38:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DF95CA75B4
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:38:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B10CA75B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:38:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDbpeg014944; Fri, 21 Jun 2019 15:38:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/TrXrkZCuUTd7lAAIFTHsIW908QY3BYTwfrLwcQLZe0=;
 b=0qaornUY9YBzSBODMW3xJA9OvnYZkMtANpxAH1gVzKKBkBywdC0vKQNvnD2iBECOWMps
 JKxxEYPqFWw7v7HaATQ9KWLsA8ucQssxnoKj3Llg3AXO3knLGCPl0ZIkT8MX8ToXLzAE
 0uaJkgGICWNGd3fQ0Esg78ETHfbAVD3kZGVh6OxeX1qH+mQhZOZcSC6rtNF7Rx8cngEL
 2MhTv0r1HjPGA2uwAbHRlgwAcN/YOeB3Fnx2D53e5WxNDAfkyBoRqmhMd76Pu8g50wda
 bqtYh7WOb3O/h3pohgFEUGwyjfIgDAN3UyiUHoLH7IyoiH65I9IbUAfCn+iS1RvIVVxj zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxssb5c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:38:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DD1E3D;
 Fri, 21 Jun 2019 13:38:14 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7A112A80;
 Fri, 21 Jun 2019 13:38:13 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:38:13 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:38:11 +0200
Message-ID: <20190621133811.8216-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133811.8216-1-patrice.chotard@st.com>
References: <20190621133811.8216-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Remove useless u-boot,
	dm-pre-reloc in stm32f746-disco-u-boot.dtsi
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

As in stm32f7-u-boot.dtsi these nodes already have "u-bootdm-pre-reloc"
property, no need to add them again in stm32f746-disco-u-boot.dtsi.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
index ade7285786..d8f9d8dc5f 100644
--- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
@@ -78,10 +78,6 @@
 	};
 };
 
-&clk_hse {
-	u-boot,dm-pre-reloc;
-};
-
 &fmc {
 	/* Memory configuration from sdram datasheet MT48LC_4M32_B2B5-6A */
 	bank1: bank@0 {
@@ -123,9 +119,7 @@
 	};
 
 	fmc_pins: fmc@0 {
-		u-boot,dm-pre-reloc;
 		pins {
-			u-boot,dm-pre-reloc;
 			pinmux = <STM32_PINMUX('D',10, AF12)>, /* D15 */
 				 <STM32_PINMUX('D', 9, AF12)>, /* D14 */
 				 <STM32_PINMUX('D', 8, AF12)>, /* D13 */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
