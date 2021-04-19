Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD29363F41
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Apr 2021 11:58:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A460C57B76;
	Mon, 19 Apr 2021 09:58:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68452C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Apr 2021 09:58:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J9wMH9028571; Mon, 19 Apr 2021 11:58:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=R4dak8VQVsGXB8WuQgWXVbFJeXlQ7Onp6HGsDKXsVXg=;
 b=XPA4gFEUW4sApd1YtH1nQdkH7a4ah8ooSNFuqDNpYKRiPDJtQymDhU9Jv1Qj928Z7Rij
 +BG657wQmyGGymZvN0Okrv0Zb+2OcYdIVn2Srj0uVnpR496AoeX0yWJe8be0HbWvf5MC
 3jDoILTwpNh3h0Vbt74sNiLK9MFw1uBqSaBGNxz4J2R96/A/JuWA9r8PiuvhGnAhPEGD
 9GJbzRhnWg7K39f1v+hKZv6vBKNr9Nix4V2ZbVTZfCUGEMp5BD12oD8v7VtY4E5uyqae
 5YOmeInWz3yMndvfSz5SmRxFmmbnZq2K+KP3/YDU41VIbzrtbYjvAGvWY9D6G9MXJnce 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 380s533h4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 11:58:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE87010003B;
 Mon, 19 Apr 2021 11:45:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFAF920A66D;
 Mon, 19 Apr 2021 11:45:48 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:45:48
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Apr 2021 11:45:34 +0200
Message-ID: <20210419094534.9748-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419094534.9748-1-patrice.chotard@foss.st.com>
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_07:2021-04-16,
 2021-04-19 signatures=0
Cc: Marek Vasut <marex@denx.de>, Walter Lozano <walter.lozano@collabora.com>,
 Simon Glass <sjg@chromium.org>, Pratyush Yadav <p.yadav@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Herbert Poetzl <herbert@13thfloor.at>
Subject: [Uboot-stm32] [PATCH v2 5/5] test/py: Add usb gadget binding test
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

---

Changes in v2:
  - add bind test

 test/py/tests/test_bind.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/test/py/tests/test_bind.py b/test/py/tests/test_bind.py
index 6703325c0b..56edd78863 100644
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
+	assert in_tree(tree, 'usb@1', 'eth', 'usb_ether', 1, True)
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
