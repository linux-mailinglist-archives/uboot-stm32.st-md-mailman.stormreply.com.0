Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E831BF38C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:52:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8129CC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 08:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C2CEC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 08:52:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U8qZ3r029052; Thu, 30 Apr 2020 10:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=i2l7MRl0YpcEkMDtMW/1sF/cjlnhL+FlDY+h7zWcDh8=;
 b=LvO7cXnD+d3aLg/azvqJ1XhG2LI45CnZ7EVlrhTt9kJc2gH0jK6z/SZi5hC8926F6o/+
 uVhXGwdk5Dlr1eWS/In4KhFNAG1B/3IktwDJaCqZJsAKaSzhmC56eLU6KfufSJoRQlg9
 WgJveoONKh+cb5bXnBW9rq5Z63rY8+iXhOEBJIE02XF4rmUjn3NsG/0u1M5R1F+CUqKk
 h28GH+Md+ZGmrL2ZtWOwkTks1CMeGVpmQXBb7T0zt2MELmW/XGm0jgcJnsMIOHtODDbK
 GVWXZuDpHVY7txeIpgVzRgzGhGXzA6PN5vx7sXeNTssumbthGtNeX6KDvrbLhaIjJKmV pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx34pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 10:52:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 230C410003A;
 Thu, 30 Apr 2020 10:52:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 150EB2AE6C4;
 Thu, 30 Apr 2020 10:52:33 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 10:52:32 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 10:52:24 +0200
Message-ID: <20200430085226.19349-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430085226.19349-1-patrice.chotard@st.com>
References: <20200430085226.19349-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_03:2020-04-30,
 2020-04-30 signatures=0
Cc: Simon Glass <sjg@chromium.org>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 3/5] sandbox: dts: Add compatible string
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
The other impact, is that bind-test node is binded at sandbox
start, so no need to bind it in test_bind_unbind_with_node() test

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v3: None
Changes in v2: None

 arch/sandbox/dts/test.dts  | 1 +
 test/py/tests/test_bind.py | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index df9f1835c9..7c6b14887f 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -131,6 +131,7 @@
 	};
 
 	bind-test {
+		compatible = "simple-bus";
 		bind-test-child1 {
 			compatible = "sandbox,phy";
 			#phy-cells = <1>;
diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index 20c6050342..0b7cd9a808 100644
--- a/test/py/tests/test_bind.py
+++ b/test/py/tests/test_bind.py
@@ -25,9 +25,6 @@ def in_tree(response, name, uclass, drv, depth, last_child):
 @pytest.mark.buildconfigspec('cmd_bind')
 def test_bind_unbind_with_node(u_boot_console):
 
-	#bind /bind-test. Device should come up as well as its children
-	response = u_boot_console.run_command('bind  /bind-test generic_simple_bus')
-	assert response == ''
 	tree = u_boot_console.run_command('dm tree')
 	assert in_tree(tree, 'bind-test', 'simple_bus', 'generic_simple_bus', 0, True)
 	assert in_tree(tree, 'bind-test-child1', 'phy', 'phy_sandbox', 1, False)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
