Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 770774A4BC7
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 17:21:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 364DAC5F1EC;
	Mon, 31 Jan 2022 16:21:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F3DC5EC55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 16:21:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VG7516029678;
 Mon, 31 Jan 2022 17:21:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=4anPoObEdi8rX5WL9pUWm1eXqHi3Xczq0h3klwVVVbA=;
 b=XvGQmOsdizf/V90ac1jmA8cBwMXsHaCxIi1Ky8oefoRkqtNbJhuB9BcHH10EVfaPgp56
 j4mXDnJLXTqnKXpk1htr3CM3yZ8iQkL7FPnIGV/sKFHtP7Kf6GkGE7KoaH2qvenO9bvJ
 xMHvbuBNih5ODgT4pwKpwG9AFsap1x6FOWVW9pLg1KM8nTWG0EGyuKR0/iWeHTS8be9/
 qmyg1/LgF8qbVLm7yuIbISnM3xWvBxKYP5y62RPsvGcQI9n9rpkPOh1ZG5VK3qwgTsej
 kTyEEgRhQirrOyMuuqlNCI6nylba4mVOPnw9FY++5aymYDePNfUOFl2tBDLNaSPg1A5B OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dxk0rr2nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:21:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B21F100034;
 Mon, 31 Jan 2022 17:21:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93883222CA0;
 Mon, 31 Jan 2022 17:21:47 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan 2022 17:21:47
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 31 Jan 2022 17:21:39 +0100
Message-ID: <20220131172131.3.Iec2029edb7fc0b29e13bcb86058ad2f614f62779@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
References: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/4] cmd: clk: update result of do_clk_setfreq
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

Update the result of do_clk_setfreq and always returns a CMD_RET_ value
(-EINVAL was a possible result).

This patch avoid the CLI output "exit not allowed from main input shell."

Fixes: 7ab418fbe612 ("clk: add support for setting clk rate from cmdline")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index d615f14a84..73dea5e746 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -116,7 +116,7 @@ static int do_clk_setfreq(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	if (!clk) {
 		printf("clock '%s' not found.\n", argv[1]);
-		return -EINVAL;
+		return CMD_RET_FAILURE;
 	}
 
 	freq = clk_set_rate(clk, freq);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
