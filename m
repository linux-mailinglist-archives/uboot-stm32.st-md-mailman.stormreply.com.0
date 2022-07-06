Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C50568EF0
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jul 2022 18:21:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080D8C03FDB;
	Wed,  6 Jul 2022 16:21:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BEBDC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 16:21:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266DBgxC004614;
 Wed, 6 Jul 2022 18:21:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Fj8+FtK57hIT/PpUQW/tfPIbiBsEYLcnNtMQfdnPhPo=;
 b=qX/2qRRkXwpKfjoexdF7+VC+dpQKbe8JDZ5MVv7SKE2Xu9KB+HbP2vE3fQfEEZ9TS+Xn
 wgSy3V+hMCBIuEqBisIexwjkzG3qjWdG2+1JCLYPuPUfWRYvJ9jX23emJFmE83+TfkwM
 jFwtrDqgOW1nS5GHWT95YUgWcDiQy854nVic/mqDHlB5l8pljCxl/RJzSOMdCXF+xxwg
 XuQiz9VYRbj5P0gDt4quYXla76L/7XtJNzX6anjxukazz6rkXa7Mb4WerSu7rjF7xEm4
 66zF3x+3HoECOJQxM9zSkUu9+VlTkShVscEPjZ1az7HYiOrhDFuqHdl9CZa2o7we8mOQ gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub3y7kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jul 2022 18:21:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE7B4100034;
 Wed,  6 Jul 2022 18:21:05 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C87EF228A5F;
 Wed,  6 Jul 2022 18:21:05 +0200 (CEST)
Received: from localhost (10.75.127.48) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 6 Jul
 2022 18:20:34 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Jul 2022 18:20:25 +0200
Message-ID: <20220706181934.2.Ib7191e51ac93329b8d744b84f1f56ced2564f72d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706181934.1.I174d63cabaf30764ad59c73751d323a8b27fca60@changeid>
References: <20220706181934.1.I174d63cabaf30764ad59c73751d323a8b27fca60@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp13: add SCMI nodes
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

Add the node for SCMI firmware with the associated reserved memory nodes

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi | 20 +++++++++++++++++++
 arch/arm/dts/stm32mp131.dtsi       | 31 ++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index adc7e67ee58..01552adb7c4 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -90,6 +90,26 @@
 	u-boot,dm-pre-reloc;
 };
 
+&scmi {
+	u-boot,dm-pre-reloc;
+};
+
+&scmi_clk {
+	u-boot,dm-pre-reloc;
+};
+
+&scmi_reset {
+	u-boot,dm-pre-reloc;
+};
+
+&scmi_shm {
+	u-boot,dm-pre-reloc;
+};
+
+&scmi_sram {
+	u-boot,dm-pre-reloc;
+};
+
 &syscfg {
 	u-boot,dm-pre-reloc;
 };
diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
index 652743fd06e..8f7af65e3ed 100644
--- a/arch/arm/dts/stm32mp131.dtsi
+++ b/arch/arm/dts/stm32mp131.dtsi
@@ -27,11 +27,42 @@
 		interrupt-parent = <&intc>;
 	};
 
+	scmi_sram: sram@2ffff000 {
+		compatible = "mmio-sram";
+		reg = <0x2ffff000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x2ffff000 0x1000>;
+
+		scmi_shm: scmi_shm@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0 0x80>;
+		};
+	};
+
 	firmware {
 		optee: optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
 		};
+
+		scmi: scmi {
+			compatible = "linaro,scmi-optee";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			linaro,optee-channel-id = <0>;
+			shmem = <&scmi_shm>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
 	};
 
 	clocks {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
