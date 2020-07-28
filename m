Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9832223039D
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:13:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 608F3C36B27
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 07:13:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC9CBC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:13:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7Dejs005313; Tue, 28 Jul 2020 09:13:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BnWLXed5Nq519sSItOp/SoK0yJ7iD/uCWpu2voZ2Z7A=;
 b=FFixCqn0NJCww/4Y8690rK6JLjOic9WXUPurdAjTKPzOVnl/FxzSeu6179fw/MuMGYUo
 R1gwqQnswa4ACbmldeJKC5T926GjbSTJQDWIcEivsFJG5G+FqNGWjjG1QeHpi1sKiPrv
 GPLZw+MWou4X/1ObMSeG3E0gHYbzT4gT/iDdrqXPvFbuxNJo65kb7EqrU/GWFJsl4UBS
 1KoN++BFZSJsj3kxEQCwbw6O46HAeamDVXLJpxdZFQFe6fo8QzbPtzF+E/8LslOaEUfx
 i8L7DYRFUrf8AiLVpaMezrTIq9QmiI3+LJrIPssC0b4o5YaweKBUY51nYNMm11LyHoKh Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv4trp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:13:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9D2C10002A;
 Tue, 28 Jul 2020 09:13:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB74721E690;
 Tue, 28 Jul 2020 09:13:42 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 09:13:42 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 09:13:33 +0200
Message-ID: <20200728071335.5840-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728071335.5840-1-patrice.chotard@st.com>
References: <20200728071335.5840-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: Heiko Schocher <hs@denx.de>, Walter Lozano <walter.lozano@collabora.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 3/5] sandbox: dts: Add compatible string
	for bind-test node
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

Usage of lists_bind_fdt() in bind command imposes to add
a compatible string for bind-test node.

Others impacts are:
  - bind-test node is binded at sandbox start, so no need to bind it
    in test_bind_unbind_with_node() test.
  - As explained just above, after sandbox start, now a phy exist.
    In test/dm/phy.c, it was verified that a third phy didn't exist,
    now we must verified that a fourth phy doesn't exist.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

Changes in v5:
  - rebase on last master
  - fix phy test regression

 arch/sandbox/dts/test.dts  | 1 +
 test/dm/phy.c              | 2 +-
 test/py/tests/test_bind.py | 3 ---
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 2ae4239721..75c31f83f4 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -135,6 +135,7 @@
 	};
 
 	bind-test {
+		compatible = "simple-bus";
 		bind-test-child1 {
 			compatible = "sandbox,phy";
 			#phy-cells = <1>;
diff --git a/test/dm/phy.c b/test/dm/phy.c
index 99f0119557..cf4c641b63 100644
--- a/test/dm/phy.c
+++ b/test/dm/phy.c
@@ -46,7 +46,7 @@ static int dm_test_phy_base(struct unit_test_state *uts)
 	ut_assert(phy2.dev != phy3.dev);
 
 	/* Try to get a non-existing phy */
-	ut_asserteq(-ENODEV, uclass_get_device(UCLASS_PHY, 3, &dev));
+	ut_asserteq(-ENODEV, uclass_get_device(UCLASS_PHY, 4, &dev));
 	ut_asserteq(-ENODATA, generic_phy_get_by_name(parent,
 					"phy_not_existing", &phy1_method1));
 
diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index e9681c69c5..1de125ce45 100644
--- a/test/py/tests/test_bind.py
+++ b/test/py/tests/test_bind.py
@@ -25,9 +25,6 @@ def in_tree(response, name, uclass, drv, depth, last_child):
 @pytest.mark.buildconfigspec('cmd_bind')
 def test_bind_unbind_with_node(u_boot_console):
 
-	#bind /bind-test. Device should come up as well as its children
-	response = u_boot_console.run_command('bind  /bind-test simple_bus')
-	assert response == ''
 	tree = u_boot_console.run_command('dm tree')
 	assert in_tree(tree, 'bind-test', 'simple_bus', 'simple_bus', 0, True)
 	assert in_tree(tree, 'bind-test-child1', 'phy', 'phy_sandbox', 1, False)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
