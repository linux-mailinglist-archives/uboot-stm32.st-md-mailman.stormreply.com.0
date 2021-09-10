Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2E406D69
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Sep 2021 16:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8C43C5A4F3;
	Fri, 10 Sep 2021 14:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0238C5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 14:16:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18AAMmxO014725;
 Fri, 10 Sep 2021 16:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=S+wNQMbIxLd9BTalvaUEQujfvvupPC+OtVgxVd3EyBA=;
 b=bfFFhq/tqXet8b1Sex4iD4EF8TCgOV7fu0D3fbPAP5n4/aY6Jmno3vVJdv8TjoQCFvk4
 glA69FDsHSUYYvQtPsDI2LVLTNIu2b46wAouKKUCTsXDU6ucwzjKH6eVc/TT7g62sRHu
 gkbCLy1mq32gA1w5se0GYCGSjLhjycZ/OEcx14nTHn8QmM02veRXaCCp1bav/ND8XuJX
 b90d2PCtBj8xWii3hjaWufNtajQT7lKaKhNsHBm8PW9Yn6CpJidS/m/rAq8MqbPkvso4
 KhYehYnch+kzpxx7XPHbO4WHWrkyxTy84MObn3v76aOkEDXzUnjBdw4yclPW3bLasFdX lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b05jdh54c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 16:16:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F727100034;
 Fri, 10 Sep 2021 16:16:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5354621F0A7;
 Fri, 10 Sep 2021 16:16:31 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG1NODE2.st.com (10.75.127.2)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep 2021 16:16:31
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Sep 2021 16:16:24 +0200
Message-ID: <20210910141624.25133-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910141624.25133-1-patrice.chotard@foss.st.com>
References: <20210910141624.25133-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Herbert Poetzl <herbert@13thfloor.at>
Subject: [Uboot-stm32] [RESEND][PATCH v2 5/5] test/py: Add usb gadget
	binding test
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

Add a specific usb gadget binding test which check that
binding a driver without compatible string is working as expected.

the command "bind /usb@1 usb_ether" should give the following "dm tree"
command output:

[...]
 usb           0  [   ]   usb_sandbox           |-- usb@1
 usb_hub       0  [   ]   usb_hub               |   |-- hub
 usb_emul      0  [   ]   usb_sandbox_hub       |   |   `-- hub-emul
 usb_emul      1  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@0
 usb_emul      2  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@1
 usb_emul      3  [   ]   usb_sandbox_flash     |   |       |-- flash-stick@2
 usb_emul      4  [   ]   usb_sandbox_keyb      |   |       `-- keyb@3
 eth           4  [   ]   usb_ether             |   `-- usb@1
[...]

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Herbert Poetzl <herbert@13thfloor.at>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v2:
   - add bind test

 test/py/tests/test_bind.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index 6703325c0b..9f234fb635 100644
--- a/test/py/tests/test_bind.py
+++ b/test/py/tests/test_bind.py
@@ -33,6 +33,13 @@ def test_bind_unbind_with_node(u_boot_console):
 	assert in_tree(tree, 'bind-test-child1', 'phy', 'phy_sandbox', 1, False)
 	assert in_tree(tree, 'bind-test-child2', 'simple_bus', 'simple_bus', 1, True)
 
+	#bind usb_ether driver (which has no compatible) to usb@1 node.
+	##New entry usb_ether should appear in the dm tree
+	response = u_boot_console.run_command('bind  /usb@1 usb_ether')
+	assert response == ''
+	tree = u_boot_console.run_command('dm tree')
+	assert in_tree(tree, 'usb@1', 'ethernet', 'usb_ether', 1, True)
+
 	#Unbind child #1. No error expected and all devices should be there except for bind-test-child1
 	response = u_boot_console.run_command('unbind  /bind-test/bind-test-child1')
 	assert response == ''
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
