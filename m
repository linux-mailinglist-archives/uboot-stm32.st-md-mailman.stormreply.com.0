Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03192567B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 19:19:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD45FC35E0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 17:19:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E0D8C35E05
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:19:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LHDSCm025422; Tue, 21 May 2019 19:19:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+nV+OeL+EXYsyP6H51Zt61GYO+v9URHlxkoiZD32CLU=;
 b=VztTIk1iZ+p7O5W3Y2TjtyC+mxE9SntTpanqT1zspE8GgBxnKgXmZZTabt48ywd9unpv
 xWXUwxcQ9f4unMBBN6mVT4rRmeI8dLewSRifunbo4ughoQD5x4GEORwmInq6aSsH2JYq
 iM70s7yjFX7LWWfrEVaGNwkce+RLeZTqkPUfCddlM+vg8tPzlr+Wiqlnpy4FiMNiF4j/
 FDgqQ4Dio6RuqbpnphebFtmHoTj6Cptq0bNGRuyeI4aB8HLqz/n3x7l03BbtjJqHztOM
 zcXGt6ZBzvejb4cnuDwc7MUOycXKwaYwhpHr7DqsLwXWjHrxzy3ptv/YbiS6ktoQD8ye hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0u31q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 19:19:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C32634;
 Tue, 21 May 2019 17:19:29 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 148234F14;
 Tue, 21 May 2019 17:19:29 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 19:19:28 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 19:19:28
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 May 2019 19:19:11 +0200
Message-ID: <1558459153-14104-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_04:, , signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Jens
 Wiklander <jens.wiklander@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 1/3] test: check u-boot properties in SPL
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

Add a test to check the management of the U-boot relocation properties
for device tree SPL generation (fdtgrep result) and platdata:
- 'dm-pre-proper' and 'dm-tpl' not included in SPL
- 'dm-pre-reloc' and 'dm-spl' included in SPL

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- simplify test after Simon remarks by using fdtgrep on spl dtb

Changes in v2: None

 arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
 test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/sandbox/dts/sandbox.dtsi b/arch/sandbox/dts/sandbox.dtsi
index 2fb365d..c6d5650 100644
--- a/arch/sandbox/dts/sandbox.dtsi
+++ b/arch/sandbox/dts/sandbox.dtsi
@@ -192,6 +192,24 @@
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
 	square {
 		compatible = "demo-shape";
 		colour = "blue";
diff --git a/test/py/tests/test_ofplatdata.py b/test/py/tests/test_ofplatdata.py
index 98103ee..263334b 100644
--- a/test/py/tests/test_ofplatdata.py
+++ b/test/py/tests/test_ofplatdata.py
@@ -2,6 +2,7 @@
 # Copyright (c) 2016 Google, Inc
 
 import pytest
+import u_boot_utils as util
 
 OF_PLATDATA_OUTPUT = '''
 of-platdata probe:
@@ -31,6 +32,15 @@ intarray 0 0 0 0
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
 '''
 
 @pytest.mark.buildconfigspec('spl_of_platdata')
@@ -40,3 +50,21 @@ def test_ofplatdata(u_boot_console):
     cons.restart_uboot_with_flags(['--show_of_platdata'])
     output = cons.get_spawn_output().replace('\r', '')
     assert OF_PLATDATA_OUTPUT in output
+
+@pytest.mark.buildconfigspec('spl_of_platdata')
+def test_spl_devicetree(u_boot_console):
+    """Test content of spl device-tree"""
+    cons = u_boot_console
+    dtb = cons.config.build_dir + '/spl/u-boot-spl.dtb'
+    fdtgrep = cons.config.build_dir + '/tools/fdtgrep'
+    output = util.run_and_log(cons, [fdtgrep, '-l', dtb])
+
+    assert "u-boot,dm-pre-reloc" not in output
+    assert "u-boot,dm-pre-proper" not in output
+    assert "u-boot,dm-spl" not in output
+    assert "u-boot,dm-tpl" not in output
+
+    assert "spl-test4" in output
+    assert "spl-test5" not in output
+    assert "spl-test6" not in output
+    assert "spl-test7" in output
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
