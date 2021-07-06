Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7713BDA00
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Jul 2021 17:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD857C5718D;
	Tue,  6 Jul 2021 15:19:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCE26C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jul 2021 15:19:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166FCga7032729; Tue, 6 Jul 2021 17:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=K1Rz93s0Q6QffKV/I0KtOvXbuidNCJrbayZn0tUq0es=;
 b=WmJBgOdnpr0oSymFJEyig1lnCKza+9Nzynxa0L1OheNYfQE8qbFagi+s+8gahrh2JCqU
 dpOPK+loLqP7Y/KzMsEX3QkPg1aVIlO7vf4m7EYejeiJ6RqNMcP9LL+r4KcmTfJOYHRT
 caWcOc2hsnIi1S0ddoEeBHfPFDrM2eWoiIsbmyClxTj+fqokHvhuOSB1kHpGa+gw69IF
 w49/6PBCfphBJ7IpooXEJeFVqaMmJhdsn5QHHCWLgHb2LAVJAYehUA8djDs/8NmKly2K
 l6MNmWnfO7lt9xbz62ROU6ns98oh0FzVXkh+ERDYjvV3iKmrqwMttijtb5rldXENsZYj KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mdvf3sge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 17:19:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38597100038;
 Tue,  6 Jul 2021 17:19:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2563E21BF56;
 Tue,  6 Jul 2021 17:19:50 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul 2021 17:19:49
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Jul 2021 17:19:46 +0200
Message-ID: <20210706171943.2.I273d18dde276f6579a08f4755940468325e5f3e8@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
References: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_07:2021-07-06,
 2021-07-06 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp15: remove mmc alias
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

Remove the mmc alias no more required as the sequence number
of mmc device is used for boot_instance.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 -
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 6787619290..7dcc96c19c 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -10,7 +10,6 @@
 / {
 	aliases {
 		i2c3 = &i2c4;
-		mmc0 = &sdmmc1;
 		usb0 = &usbotg_hs;
 	};
 	config {
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index f3002e995b..46a43371bd 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -10,8 +10,6 @@
 / {
 	aliases {
 		i2c3 = &i2c4;
-		mmc0 = &sdmmc1;
-		mmc1 = &sdmmc2;
 	};
 
 	config {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
