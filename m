Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B698C213CB2
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F364C36B26
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA94C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FaEU3008090; Fri, 3 Jul 2020 17:37:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=N2W5sWus2mvB9LhaZbkKoKlMUjyvi7Mc3VtEpjt8/s0=;
 b=QNigeFe33tPtAieFnU+BHnwDyN73sG8LOfae5DU7nLVb+9FuOEUcGqejFZ4PvU5mhO0o
 Mj2n9VU6W5hZ36dI3/rdqvWtJ9S8Ggxk2VIvMDI8ir8tVCLAmqoNC0feTyR0pU+/mGbQ
 c7g5jXgOL0rOmN6RynJPei9WKw/3+cMUE8kdk06PNGw+WI4+kUK0PXdWCRdo18P23mFd
 cN4Pqo41WlOXEFuefXl2MP5qAnH/wXQcWienfr3JI3fflIqzcBW711avGRAR1rNdGS0H
 8EIZB7LMR2JXc1+jmBk6Q9Pc4ZpPRnCGzQD9OwuEz1G+u5clmWzQFpwspf98dA2gRVSo 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1yb3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7894710003E;
 Fri,  3 Jul 2020 17:37:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6947B2AA270;
 Fri,  3 Jul 2020 17:37:00 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:36:59 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:41 +0200
Message-ID: <20200703153646.28533-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703153646.28533-1-patrick.delaunay@st.com>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [Uboot-stm32] [PATCH v3 2/7] board: sunxi: change trace level for
	phy errors managed by uclass
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

(no changes since v1)

 board/sunxi/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index f32e8f582f..f1925f032d 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -711,7 +711,7 @@ int g_dnl_board_usb_cable_connected(void)
 
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
