Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF03E1D27
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 473C1C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 279F0C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDh5sq001122; Wed, 23 Oct 2019 15:45:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VOL/B2jNi2SrigXMMufblmyEWFOCwuf3sf2fSFE1Rk8=;
 b=OkURvoASyIC1xr9yhU99j1bttE+HeKTALaF4stHTkK23Nbv5eTy1zO08xoAECz+pmAhw
 I+dG6nJ8kW/BhmdCogs3gvXHNoQlJoQ/i2LKFvZotpVGJY2UgPGdZB1M72HIl/x94o53
 Tv8ANzmI4swihykkWpRGXLD+GL4ta4PI71ey5lnrOzDaJp3krURTmBUBxn+gQr7SANtp
 DRXpMyicTKfVik4BSP4QEBi19xLFpnWnT233KPkAcLxDDjA6+em4mR40XMjTutgXaWxB
 tGvF+3yH4TLWnAKa+tzh8ngXJpSzB6Ru7ZRtN/2GMmZeDceC809BMTO5ryqFJaaQVIdK Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s43xkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD945100039;
 Wed, 23 Oct 2019 15:45:07 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B01CF2FF5FE;
 Wed, 23 Oct 2019 15:45:07 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:07 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:07
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:44 +0200
Message-ID: <20191023134448.20149-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
 Simon Glass <sjg@chromium.org>, Alex Marginean <alexandru.marginean@nxp.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 09/13] test: dm: update test for pins
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
---

 arch/sandbox/dts/test.dts         | 25 +++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-sandbox.c | 14 +++++++++++++-
 test/py/tests/test_pinmux.py      | 28 ++++++++++++++++++----------
 3 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 42b41fbf62..35e80219a8 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -847,6 +847,31 @@
 
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
