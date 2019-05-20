Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A8236A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7721FC0D2AB
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9B9C0D2A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:26 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfAvn021244; Mon, 20 May 2019 15:00:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=o9FDPbaTKU7ObZVpXyYjfsSZwShnBgjQEKWUu5ema7Q=;
 b=UtY9mZRmLNPzNk0JKYrG50eBnbZGvopWv8I6L8OWxycjifymWIV0MmHoGNjhzQPeyaZZ
 yV1n/L3D/2C58dzbC/KFRnHxiDQEwjVtAe2uUGz1JN9kGKe/6LaL2YLS/AUFCQclJohy
 Ce8mUZqzQM3gbSUXCb9KTVrEKSCjESVH6DbKJXkVjMu1Dz0cqWnX23rNczDVx01Vfk04
 t/HMV0NIlTQjhH4Ty4Ly5V4xPXphY4eZvVe3EKfmVYPaUco/mC9KeFHeku8B8MxeS+/5
 s+ISTe8e68DDGNEwPyBWxbx6A3ZdKUeFTGdiyaqQ5zB774HBA3C2zqV5zWsQrYzOHF/t mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttukvw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DEA631;
 Mon, 20 May 2019 13:00:21 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CFA828C2;
 Mon, 20 May 2019 13:00:21 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:21 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:20
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:05 +0200
Message-ID: <1558357207-7345-7-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 6/8] test: check u-boot properties in SPL
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

Add a test to check the management of the u-boot relocation properties
(fdtgrep result) for platdata generation or device tree SPL generation:
- 'dm-pre-proper' and 'dm-tpl' not included in SPL
- 'dm-pre-reloc' and 'dm-spl' included in SPL

This patch also executes the version test (test_000_version) to check
the correct start of the U-Boot after SPL execution.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add some test for SPL with device tree

 arch/sandbox/dts/test.dts        | 18 ++++++++++++++
 test/py/tests/test_ofplatdata.py | 53 ++++++++++++++++++++++++++++++++++++++++
 test/run                         |  5 ++++
 3 files changed, 76 insertions(+)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 1ac86d7..2d5bea3 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -621,6 +621,24 @@
 		compatible = "sandbox,spl-test.2";
 	};
 
+	spl-test5 {
+		u-boot,dm-tpl;
+		compatible = "sandbox,spl-test";
+		stringarray = "tpl";
+	};
+
+	spl-test6 {
+		u-boot,dm-pre-proper;
+		compatible = "sandbox,spl-test";
+		stringarray = "pre-proper";
+	};
+
+	spl-test7 {
+		u-boot,dm-spl;
+		compatible = "sandbox,spl-test";
+		stringarray = "spl";
+	};
+
 	syscon0: syscon@0 {
 		compatible = "sandbox,syscon0";
 		reg = <0x10 16>;
diff --git a/test/py/tests/test_ofplatdata.py b/test/py/tests/test_ofplatdata.py
index 98103ee..bdabc5a 100644
--- a/test/py/tests/test_ofplatdata.py
+++ b/test/py/tests/test_ofplatdata.py
@@ -31,6 +31,50 @@ intarray 0 0 0 0
 longbytearray 00 00 00 00 00 00 00 00 00
 string <NULL>
 stringarray "one" "" ""
+of-platdata probe:
+bool 0
+byte 00
+bytearray 00 00 00
+int 0
+intarray 0 0 0 0
+longbytearray 00 00 00 00 00 00 00 00 00
+string <NULL>
+stringarray "spl" "" ""
+'''
+
+OF_EMBEDDED_OUTPUT = '''
+	spl-test {
+		compatible = "sandbox,spl-test";
+		boolval;
+		intval = <0x00000001>;
+		intarray = <0x00000002 0x00000003 0x00000004>;
+		byteval = [05];
+		bytearray = [06];
+		longbytearray = [09 0a 0b 0c 0d 0e 0f 10 11];
+		stringval = "message";
+		stringarray = "multi-word", "message";
+	};
+	spl-test2 {
+		compatible = "sandbox,spl-test";
+		intval = <0x00000003>;
+		intarray = <0x00000005>;
+		byteval = [08];
+		bytearray = [01 23 34];
+		longbytearray = <0x090a0b0c>;
+		stringval = "message2";
+		stringarray = "another", "multi-word", "message";
+	};
+	spl-test3 {
+		compatible = "sandbox,spl-test";
+		stringarray = "one";
+	};
+	spl-test4 {
+		compatible = "sandbox,spl-test.2";
+	};
+	spl-test7 {
+		compatible = "sandbox,spl-test";
+		stringarray = "spl";
+	};
 '''
 
 @pytest.mark.buildconfigspec('spl_of_platdata')
@@ -40,3 +84,12 @@ def test_ofplatdata(u_boot_console):
     cons.restart_uboot_with_flags(['--show_of_platdata'])
     output = cons.get_spawn_output().replace('\r', '')
     assert OF_PLATDATA_OUTPUT in output
+
+@pytest.mark.buildconfigspec('of_embed')
+@pytest.mark.buildconfigspec('spl_of_libfdt')
+def test_ofembed(u_boot_console):
+    """Test that device-tree can be generated and used in sandbox spl"""
+    cons = u_boot_console
+    cons.restart_uboot_with_flags(['--show_of_embedded'])
+    output = cons.get_spawn_output().replace('\r', '')
+    assert OF_EMBEDDED_OUTPUT in output
diff --git a/test/run b/test/run
index 5aceed7..4702c4d 100755
--- a/test/run
+++ b/test/run
@@ -26,6 +26,11 @@ run_test "sandbox_spl" ./test/py/test.py --bd sandbox_spl --build \
 	--device-tree test \
 	-k 'test_000_version or test_ofplatdata or test_handoff'
 
+# Run tests which require sandbox_spl_dtb , with test.dtb device tree
+run_test "sandbox_spl_dtb" ./test/py/test.py --bd sandbox_spl_dtb --build \
+	--device-tree test \
+	-k 'test_000_version or test_ofplatdata'
+
 # Run tests for the flat-device-tree version of sandbox. This is a special
 # build which does not enable CONFIG_OF_LIVE for the live device tree, so we can
 # check that functionality is the same. The standard sandbox build (above) uses
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
