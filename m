Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF217F7D4
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 15:07:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03390C35E05
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:07:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FB4BC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 13:07:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72D2NLH025017; Fri, 2 Aug 2019 15:07:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BNMlrqqUWjUpNNmVN42MgAoSMR9MpGi/RJHHPXFGCqk=;
 b=HWueW9qIRJtYGclO3i1o8YIOkFWlKhXQCdoZ9X3L2RShXUWcCugsaSN5o4w6B/uWuqbf
 gRif3CocBL9Usuxjh/Vg0Tq04a7FrHKD7BMKLhAKZWJ9APOHfYNGoYl/cISbfuplwp93
 YRE6gnh1zZ/6XCGj5q7PRIyX39TxZyCVE9hqaNg1UWVOPxuFJAaLJ8FNpJJue5mInThF
 Vxl80YkfzVaxKLqWr6PWXv/Pc4niF41KCUGbE3T2yvETnCteEXKyF1CVes2VLu2+HEvg
 BT41+7t6p27Ub6fA/II/7qm/VAlOm6D5MHkXCzWgpt7GZvO4fSHPuej/GdSX+5Uyxp7D Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4us17-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 15:07:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED4D942;
 Fri,  2 Aug 2019 13:07:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2C272C35C0;
 Fri,  2 Aug 2019 15:07:50 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 15:07:50 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:07:50
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 15:07:21 +0200
Message-ID: <1564751242-683-5-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
References: <1564751242-683-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 4/5] stm32mp1: add example files for FIT
	generation
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

Add example of its files to generate FIT to start kernel
on ev1 or dk2 board with
- only kernel and dtb = fit_copro_kernel_dtb.its
- kernel, M4 copro firmware and dtb = it_copro_kernel_dtb.its

Add extlinux example to manage config in generated FIT.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/extlinux.conf            |  20 ++++++
 board/st/stm32mp1/fit_copro_kernel_dtb.its | 103 +++++++++++++++++++++++++++++
 board/st/stm32mp1/fit_kernel_dtb.its       |  82 +++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 board/st/stm32mp1/extlinux.conf
 create mode 100644 board/st/stm32mp1/fit_copro_kernel_dtb.its
 create mode 100644 board/st/stm32mp1/fit_kernel_dtb.its

diff --git a/board/st/stm32mp1/extlinux.conf b/board/st/stm32mp1/extlinux.conf
new file mode 100644
index 0000000..2b46328
--- /dev/null
+++ b/board/st/stm32mp1/extlinux.conf
@@ -0,0 +1,20 @@
+# Generic Distro Configuration for STM32MP157
+menu title Select the boot mode
+TIMEOUT 20
+DEFAULT stm32mp157c-ev1
+
+LABEL stm32mp157c-ev1
+	KERNEL /fit_kernel_dtb.itb#ev1
+	APPEND root=/dev/mmcblk0p6 rootwait rw earlyprintk console=ttyS3,115200
+
+LABEL stm32mp157c-ev1-m4
+	KERNEL /fit_copro_kernel_dtb.itb#ev1-m4
+	APPEND root=/dev/mmcblk0p6 rootwait rw earlyprintk console=ttyS3,115200
+
+LABEL stm32mp157c-dk2
+	KERNEL /fit_kernel_dtb.itb#dk2
+	APPEND root=/dev/mmcblk0p6 rootwait rw earlyprintk console=ttyS3,115200
+
+LABEL stm32mp157c-dk2-m4
+	KERNEL /fit_copro_kernel_dtb.itb#dk2-m4
+	APPEND root=/dev/mmcblk0p6 rootwait rw earlyprintk console=ttyS3,115200
diff --git a/board/st/stm32mp1/fit_copro_kernel_dtb.its b/board/st/stm32mp1/fit_copro_kernel_dtb.its
new file mode 100644
index 0000000..3e08fd9
--- /dev/null
+++ b/board/st/stm32mp1/fit_copro_kernel_dtb.its
@@ -0,0 +1,103 @@
+/*
+ * Compilation:
+ * mkimage -f fit_copro_kernel_dtb.its fit_copro_kernel_dtb.itb
+ */
+
+/dts-v1/;
+/ {
+	description = "U-Boot fitImage for stm32mp157";
+	#address-cells = <1>;
+
+	images {
+
+		copro {
+			description = "M4 copro";
+			data = /incbin/("rproc-m4-fw.elf");
+			type = "copro";
+			arch = "arm";
+			compression = "none";
+			load = <0xC0800000>;
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		kernel {
+			description = "Linux kernel";
+			data = /incbin/("zImage");
+			type = "kernel";
+			arch = "arm";
+			os = "linux";
+			compression = "none";
+			load = <0xC0008000>;
+			entry = <0xC0008000>;
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		fdt-dk2 {
+			description = "FDT dk2";
+			data = /incbin/("stm32mp157c-dk2.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		fdt-ev1 {
+			description = "FDT ev1";
+			data = /incbin/("stm32mp157c-ev1.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		default = "dk2-m4";
+
+		dk2-m4 {
+			description = "dk2-m4";
+			loadables = "copro";
+			kernel = "kernel";
+			fdt = "fdt-dk2";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		dk2 {
+			description = "dk2";
+			kernel = "kernel";
+			fdt = "fdt-dk2";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		ev1-m4 {
+			description = "ev1-m4";
+			loadables = "copro";
+			kernel = "kernel";
+			fdt = "fdt-ev1";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		ev1 {
+			description = "ev1";
+			kernel = "kernel";
+			fdt = "fdt-ev1";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+};
diff --git a/board/st/stm32mp1/fit_kernel_dtb.its b/board/st/stm32mp1/fit_kernel_dtb.its
new file mode 100644
index 0000000..18d03eb
--- /dev/null
+++ b/board/st/stm32mp1/fit_kernel_dtb.its
@@ -0,0 +1,82 @@
+/*
+ * Compilation:
+ * mkimage -f fit_kernel_dtb.its fit_kernel_dtb.itb
+ *
+ * Files in linux build dir:
+ * - arch/arm/boot/zImage
+ * - arch/arm/boot/dts/stm32mp157c-dk2.dtb
+ * - arch/arm/boot/dts/stm32mp157c-ev1.dtb
+ *
+ * load mmc 0:4 $kernel_addr_r fit_kernel_dtb.itb
+ * bootm $kernel_addr_r
+ * bootm $kernel_addr_r#dk2
+ * bootm $kernel_addr_r#ev1
+ *
+ * or use extlinux.conf in this directory
+ */
+
+/dts-v1/;
+/ {
+	description = "U-Boot fitImage for stm32mp157";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "Linux kernel";
+			data = /incbin/("zImage");
+			type = "kernel";
+			arch = "arm";
+			os = "linux";
+			compression = "none";
+			load = <0xC0008000>;
+			entry = <0xC0008000>;
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		fdt-dk2 {
+			description = "FDT dk2";
+			data = /incbin/("stm32mp157c-dk2.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		fdt-ev1 {
+			description = "FDT ev1";
+			data = /incbin/("stm32mp157c-ev1.dtb");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		default = "dk2";
+
+		dk2 {
+			description = "dk2";
+			kernel = "kernel";
+			fdt = "fdt-dk2";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+
+		ev1 {
+			description = "ev1";
+			kernel = "kernel";
+			fdt = "fdt-ev1";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
