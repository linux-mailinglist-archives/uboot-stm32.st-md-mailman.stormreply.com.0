Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACB236AA
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1537C0D2B6
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 127BCC0D2B4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCf9hn021240; Mon, 20 May 2019 15:00:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QmAdz0Yh1gyvUqIpthUvoWa7aDQUfU4sKiLxbpcULmQ=;
 b=b0vsQALLayls2WW+Q+yYvMhfIMAiDlF+Gm4FXqF4ZEmvASSoF6cH18w6YWH0MsMD4LJR
 pSrytY2BiPDmbj3myMZao7bKbkrNRzsGXwit6DVpgX57afTTm6QHXiz1UiK//M4E8ohQ
 2b28ag0NPBkrP5cOpD3TJCc8tTnO9tdNMoCAUm1TpIs8AraRtiOHYSr14q6nSag3HbXp
 1Whn66mvjYI2junVFA1QJBhnjoLo8Pb9NjS2EFsG+ZWhtxwWUt1y+peP3bbVUapHePFx
 9NCRuhRXwj21BrG6KtlpuMedc+JKjOO9QUBzNd89a+H3wdtw2+lK9N4wNxc9JUrPPm73 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttukvu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:20 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1ED0634;
 Mon, 20 May 2019 13:00:20 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E482928B3;
 Mon, 20 May 2019 13:00:19 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:19 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:04 +0200
Message-ID: <1558357207-7345-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 5/8] test: move SPL test nodes in test
	device tree
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

Moves spl-test nodes in test device tree, selected by
the new build option '--device-tree'.

This patch also executes the version test (test_000_version) to check
the correct start of the U-Boot after SPL execution.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- move all spl test nodes in test dtb

 arch/sandbox/dts/sandbox.dts   | 36 ------------------------------------
 arch/sandbox/dts/sandbox64.dts | 36 ------------------------------------
 arch/sandbox/dts/test.dts      | 36 ++++++++++++++++++++++++++++++++++++
 test/run                       |  3 ++-
 4 files changed, 38 insertions(+), 73 deletions(-)

diff --git a/arch/sandbox/dts/sandbox.dts b/arch/sandbox/dts/sandbox.dts
index a41b5f0..b5bc27b 100644
--- a/arch/sandbox/dts/sandbox.dts
+++ b/arch/sandbox/dts/sandbox.dts
@@ -225,42 +225,6 @@
 		};
 	};
 
-	spl-test {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		boolval;
-		intval = <1>;
-		intarray = <2 3 4>;
-		byteval = [05];
-		bytearray = [06];
-		longbytearray = [09 0a 0b 0c 0d 0e 0f 10 11];
-		stringval = "message";
-		stringarray = "multi-word", "message";
-	};
-
-	spl-test2 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		intval = <3>;
-		intarray = <5>;
-		byteval = [08];
-		bytearray = [01 23 34];
-		longbytearray = [09 0a 0b 0c];
-		stringval = "message2";
-		stringarray = "another", "multi-word", "message";
-	};
-
-	spl-test3 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		stringarray = "one";
-	};
-
-	spl-test4 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test.2";
-	};
-
 	square {
 		compatible = "demo-shape";
 		colour = "blue";
diff --git a/arch/sandbox/dts/sandbox64.dts b/arch/sandbox/dts/sandbox64.dts
index a3c95f2..766d020 100644
--- a/arch/sandbox/dts/sandbox64.dts
+++ b/arch/sandbox/dts/sandbox64.dts
@@ -190,42 +190,6 @@
 		};
 	};
 
-	spl-test {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		boolval;
-		intval = <1>;
-		intarray = <2 3 4>;
-		byteval = [05];
-		bytearray = [06];
-		longbytearray = [09 0a 0b 0c 0d 0e 0f 10 11];
-		stringval = "message";
-		stringarray = "multi-word", "message";
-	};
-
-	spl-test2 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		intval = <3>;
-		intarray = <5>;
-		byteval = [08];
-		bytearray = [01 23 34];
-		longbytearray = [09 0a 0b 0c];
-		stringval = "message2";
-		stringarray = "another", "multi-word", "message";
-	};
-
-	spl-test3 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test";
-		stringarray = "one";
-	};
-
-	spl-test4 {
-		u-boot,dm-pre-reloc;
-		compatible = "sandbox,spl-test.2";
-	};
-
 	square {
 		compatible = "demo-shape";
 		colour = "blue";
diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 8b2d645..1ac86d7 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -585,6 +585,42 @@
 		};
 	};
 
+	spl-test {
+		u-boot,dm-pre-reloc;
+		compatible = "sandbox,spl-test";
+		boolval;
+		intval = <1>;
+		intarray = <2 3 4>;
+		byteval = [05];
+		bytearray = [06];
+		longbytearray = [09 0a 0b 0c 0d 0e 0f 10 11];
+		stringval = "message";
+		stringarray = "multi-word", "message";
+	};
+
+	spl-test2 {
+		u-boot,dm-pre-reloc;
+		compatible = "sandbox,spl-test";
+		intval = <3>;
+		intarray = <5>;
+		byteval = [08];
+		bytearray = [01 23 34];
+		longbytearray = [09 0a 0b 0c];
+		stringval = "message2";
+		stringarray = "another", "multi-word", "message";
+	};
+
+	spl-test3 {
+		u-boot,dm-pre-reloc;
+		compatible = "sandbox,spl-test";
+		stringarray = "one";
+	};
+
+	spl-test4 {
+		u-boot,dm-pre-reloc;
+		compatible = "sandbox,spl-test.2";
+	};
+
 	syscon0: syscon@0 {
 		compatible = "sandbox,syscon0";
 		reg = <0x10 16>;
diff --git a/test/run b/test/run
index 55a6649..5aceed7 100755
--- a/test/run
+++ b/test/run
@@ -23,7 +23,8 @@ run_test "sandbox" ./test/py/test.py --bd sandbox --build -m "${mark_expr}"
 
 # Run tests which require sandbox_spl
 run_test "sandbox_spl" ./test/py/test.py --bd sandbox_spl --build \
-	-k 'test_ofplatdata or test_handoff'
+	--device-tree test \
+	-k 'test_000_version or test_ofplatdata or test_handoff'
 
 # Run tests for the flat-device-tree version of sandbox. This is a special
 # build which does not enable CONFIG_OF_LIVE for the live device tree, so we can
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
