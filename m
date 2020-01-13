Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F98138F40
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D53AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 590CFC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DAScND021508; Mon, 13 Jan 2020 11:35:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=y/Dm7P6mfY9gSkG2HapQvWwQ+ia2D1iIVYkCGk6IKgI=;
 b=AWWzryIK9ix0J72Ny1Ov0pILonZymAW03S4LRBVom3gLtiuKiNv61U3Jj6czq7sB7nzD
 Ow6yC6kO4db5rhVC33xH4vF/xrjFDogfinLHRI8T5s1ZRMlQm5uzdCHvLiCFdv+Vq887
 zpH42KsqdcXeRJs/oOZLxJcrRJ5F5M30rs4EOuMoA4du9jm3B+dPUOnV9bEl//2uLNkn
 UPYeyUYUWvhEJF6vIARFCwa3Q8Atxx74Iui6I8yyqx5cFQJiqKK1E7bs+sTlwhikzIsX
 gqZtgUKyRj7ov+IPaxoNOkRkEDea/z1ab4UhFAr9ZmfsBpNFzlU5xsOcCaMuwbQM4hBL sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78rykam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA30A10002A;
 Mon, 13 Jan 2020 11:35:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB8E02A96E9;
 Mon, 13 Jan 2020 11:35:30 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:30 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:12 +0100
Message-ID: <20200113103515.20879-19-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v3 18/21] test: dm: update test for pins
	configuration in pinctrl node
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

Add test for "pins" configuration in gpio uclass with set_state() ops
and test for generic parsing of pinconf_param array).

set_state() is called by:
- pinctrl_generic_set_state
 |- pinctrl_generic_set_state_subnode

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v3: None
Changes in v2: None

 arch/sandbox/dts/test.dts         | 25 +++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-sandbox.c | 14 +++++++++++++-
 test/py/tests/test_pinmux.py      | 28 ++++++++++++++++++----------
 3 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index fdb08f2111..b57f152fa3 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -851,6 +851,31 @@
 
 	pinctrl {
 		compatible = "sandbox,pinctrl";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpios>;
+
+		gpios: gpios {
+			gpio0 {
+				pins = "GPIO0";
+				bias-pull-up;
+				input-disable;
+			};
+			gpio1 {
+				pins = "GPIO1";
+				output-high;
+				drive-open-drain;
+			};
+			gpio2 {
+				pins = "GPIO2";
+				bias-pull-down;
+				input-enable;
+			};
+			gpio3 {
+				pins = "GPIO3";
+				bias-disable;
+			};
+		};
 	};
 
 	hwspinlock@0 {
diff --git a/drivers/pinctrl/pinctrl-sandbox.c b/drivers/pinctrl/pinctrl-sandbox.c
index d1a21f0f19..3ee75fbbee 100644
--- a/drivers/pinctrl/pinctrl-sandbox.c
+++ b/drivers/pinctrl/pinctrl-sandbox.c
@@ -14,7 +14,11 @@ static const char * const sandbox_pins[] = {
 	"SDA",
 	"TX",
 	"RX",
-	"W1"
+	"W1",
+	"GPIO0",
+	"GPIO1",
+	"GPIO2",
+	"GPIO3",
 };
 
 static const char * const sandbox_pins_muxing[] = {
@@ -23,6 +27,10 @@ static const char * const sandbox_pins_muxing[] = {
 	"Uart TX",
 	"Uart RX",
 	"1-wire gpio",
+	"gpio",
+	"gpio",
+	"gpio",
+	"gpio",
 };
 
 static const char * const sandbox_groups[] = {
@@ -38,6 +46,10 @@ static const char * const sandbox_functions[] = {
 	"serial",
 	"spi",
 	"w1",
+	"gpio",
+	"gpio",
+	"gpio",
+	"gpio",
 };
 
 static const struct pinconf_param sandbox_conf_params[] = {
diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py
index 25394f1faf..5ca0b4b630 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -22,11 +22,15 @@ def test_pinmux_usage_2(u_boot_console):
 def test_pinmux_status_all(u_boot_console):
     """Test that 'pinmux status -a' displays pin's muxing."""
     output = u_boot_console.run_command('pinmux status -a')
-    assert ('SCL       : I2C SCL' in output)
-    assert ('SDA       : I2C SDA' in output)
-    assert ('TX        : Uart TX' in output)
-    assert ('RX        : Uart RX' in output)
-    assert ('W1        : 1-wire gpio' in output)
+    assert ('SCL       : I2C SCL.' in output)
+    assert ('SDA       : I2C SDA.' in output)
+    assert ('TX        : Uart TX.' in output)
+    assert ('RX        : Uart RX.' in output)
+    assert ('W1        : 1-wire gpio.' in output)
+    assert ('GPIO0     : gpio bias-pull-up input-disable.' in output)
+    assert ('GPIO1     : gpio drive-open-drain.' in output)
+    assert ('GPIO2     : gpio bias-pull-down input-enable.' in output)
+    assert ('GPIO3     : gpio bias-disable.' in output)
 
 @pytest.mark.buildconfigspec('cmd_pinmux')
 @pytest.mark.boardspec('sandbox')
@@ -59,8 +63,12 @@ def test_pinmux_status(u_boot_console):
     """Test that 'pinmux status' displays selected pincontroller's pin
     muxing descriptions."""
     output = u_boot_console.run_command('pinmux status')
-    assert ('SCL       : I2C SCL' in output)
-    assert ('SDA       : I2C SDA' in output)
-    assert ('TX        : Uart TX' in output)
-    assert ('RX        : Uart RX' in output)
-    assert ('W1        : 1-wire gpio' in output)
+    assert ('SCL       : I2C SCL.' in output)
+    assert ('SDA       : I2C SDA.' in output)
+    assert ('TX        : Uart TX.' in output)
+    assert ('RX        : Uart RX.' in output)
+    assert ('W1        : 1-wire gpio.' in output)
+    assert ('GPIO0     : gpio bias-pull-up input-disable.' in output)
+    assert ('GPIO1     : gpio drive-open-drain.' in output)
+    assert ('GPIO2     : gpio bias-pull-down input-enable.' in output)
+    assert ('GPIO3     : gpio bias-disable.' in output)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
