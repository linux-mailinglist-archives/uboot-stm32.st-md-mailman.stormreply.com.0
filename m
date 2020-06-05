Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4E1EF1F5
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 09:24:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD49C36B22
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 07:24:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BD99C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 07:24:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557MSMY015882; Fri, 5 Jun 2020 09:24:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IsD5l36p+Lp03rPeYDYilEU9k7qyyUoYYZ5tYQJoAY8=;
 b=KxwPexP49BjJ8X/pDQuqPFp0jUk01sVQVbsOKJxQ4Zpzaluc6VvJILphW8qsXXkmT2n1
 QCVMww67VbTd+jMJXs0B/c9mDZfAiM5oHekRDAt3QOPt4qo48WKAz86i4bg9+gwS5b56
 4i2aYp4oKC/O3XeoJOAJh4tD7wJpoqYNjqLGKjQ7PdMTQHMCr65AR2BhaQyaHY4h8etI
 +/WjBeFbpolMLX3IRkrfOTTyL9B3Gisu0Y/SYql8xaJzkS1Fx/E5VXgYBXXd86aQFjSr
 8MzLvSL3JLHnPsqQ6eDW3b3+tyY8d2/WEgQX5C1HyMkutUkxNohM4yq4qK2uinw5VvGu FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasm9qbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 09:24:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2CDF100034;
 Fri,  5 Jun 2020 09:24:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1E232AB5BA;
 Fri,  5 Jun 2020 09:24:38 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 09:24:38 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jun 2020 09:24:30 +0200
Message-ID: <20200605092427.2.I0b49a502a439eb6530b486f5e3ab4923195bff8e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
References: <20200605092427.1.I393865d4202eca31c111da33b792596f130b73d2@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] dts: ARM: stm32mp15: add OP-TEE node in
	u-boot DTSI
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

From: Etienne Carriere <etienne.carriere@linaro.org>

Add OP-TEE firmware node in stm32mp15 U-Boot DTSI. This node is
needed since commit [1] that changed U-Boot/stm32mp15 to detect
OP-TEE availability by probing the resource instead of relying on
U-Boot configuration. The software sequence implemented by [1] is
fine but U-Boot DTS/DTSI files were not updated accordingly since,
hence OP-TEE presence is never detected by U-Boot, preventing Linux
kernel from using OP-TEE resources.

For consistency and to synchronize stm32mp15 DTSI files (excluding
U-Boot specific DTSI files) with the Linux kernel ones, this change
also moves the OP-TEE reserved memory nodes from board generic DTSI
files to U-Boot specific board DTSI files.

Link: [1] commit 43df0a159df6 ("stm32mp1: dynamically detect op-tee presence")
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 15 +++++++++++++++
 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 14 ++++++++++++++
 arch/arm/dts/stm32mp157c-ed1.dts         |  5 -----
 arch/arm/dts/stm32mp15xx-dkx.dtsi        |  5 -----
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index c52abeb1e7..3fedb6f1e1 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -20,6 +20,21 @@
 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	reserved-memory {
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+		};
+	};
+
 	led {
 		red {
 			label = "error";
diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 84af7fa47b..a07c585415 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -21,6 +21,20 @@
 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
 	};
 
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	reserved-memory {
+		optee@fe000000 {
+			reg = <0xfe000000 0x02000000>;
+			no-map;
+		};
+	};
+
 	led {
 		red {
 			label = "error";
diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
index 4fb71100f5..186dc46754 100644
--- a/arch/arm/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/dts/stm32mp157c-ed1.dts
@@ -70,11 +70,6 @@
 			reg = <0xe8000000 0x8000000>;
 			no-map;
 		};
-
-		optee@fe000000 {
-			reg = <0xfe000000 0x02000000>;
-			no-map;
-		};
 	};
 
 	aliases {
diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
index 812e370ee4..7589c6f9dc 100644
--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
@@ -58,11 +58,6 @@
 			reg = <0xd4000000 0x4000000>;
 			no-map;
 		};
-
-		optee@de000000 {
-			reg = <0xde000000 0x02000000>;
-			no-map;
-		};
 	};
 
 	led {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
