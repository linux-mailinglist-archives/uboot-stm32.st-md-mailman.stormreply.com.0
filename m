Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89AF8C60
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:02:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8814C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:02:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C9F9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:02:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9v82m024937; Tue, 12 Nov 2019 11:02:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9t2LYAiDslvIY7J9vLsWkvnzAOH5blBeCpvHz8Tuf+w=;
 b=k1WF79YrT6vgjzWpjZfcEkfPaoQxVk1V+BZhSk7vXbK1NyQAfYjo16JrR6wF/9zpQ7ZS
 YPvGNhpsEGIdqIzrVbg2lp8bHXz7oYnqKXdSkvTFxnOi0cuky75wacehSYZkVhxj8VVp
 XPzw/IWJ8Hl3UrCkuWsXAu/1nqJ4sMiD4Iy9/xCbh8Q0s/11luqPQ4EmI4S3/r/2Piqu
 sSyJ+HhCOJGsDdWazvaZ/XhKHKOBy99onP6P3MfxVi1Kse0y1sM00zP8I9QhXjWnYrIH
 Sy+++2UgxWt3raKSmJHCdoxZh6HktyFZDRc78omlopR+Id3lS7RC4liBDsJ31GOAym9T mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psts74j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 11:02:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E792110002A;
 Tue, 12 Nov 2019 11:01:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D96EB2B1B27;
 Tue, 12 Nov 2019 11:01:49 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 11:01:49 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 11:01:41 +0100
Message-ID: <20191112100145.15940-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112100145.15940-1-patrick.delaunay@st.com>
References: <20191112100145.15940-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [Uboot-stm32] [PATCH 3/7] board: sunxi: change trace level for phy
	errors managed by uclass
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

As the error message is now displayed by generic phy functions,
the pr_err can be change to pr_idebug.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/sunxi/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index e3b2d13892..95697f4aae 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -705,7 +705,7 @@ int g_dnl_board_usb_cable_connected(void)
 
 	ret = generic_phy_init(&phy);
 	if (ret) {
-		pr_err("failed to init %s USB PHY\n", dev->name);
+		pr_debug("failed to init %s USB PHY\n", dev->name);
 		return ret;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
