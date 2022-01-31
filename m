Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797C4A4BC8
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 17:21:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4756CC60466;
	Mon, 31 Jan 2022 16:21:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B724C5EC43
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 16:21:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VEoGQg024933;
 Mon, 31 Jan 2022 17:21:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=TKhrXwAS5DvUTBJ6bacWOtQez7SUr5v75upLd17+eXo=;
 b=cbRoMPSeydJa1KEvRbwiq+cqp6CBUUwysPGzreG+ZCmTZKq4166FWYRrbCm5c1JCsi0h
 lsm6cKiAI1Uz0lXYshoEffFB4/OHVwDd40DCi0LCGVDw7Eg3x8rZBhGKOGaYe3kN+0CD
 6VgWtCeXBLF9AUYR2e7sT/scdrIjgEgNZ2bZkrS1s4ZNJ4yblGSaBIGykvwu19RZYAEJ
 Ki8ZBPmrlKAJtC/vaTtuJX5r33aIffWFqb/CZkVuZUeNK8c6h3M/HfmXppd4mq9hV1lb
 kLUSmocydSzawiBimmclgOdDLryei2UQF+ztpcwaUFTabRPiEtAzIcEU1ByX/IHSi7Ju Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dwutpmjme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:21:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68E5E10002A;
 Mon, 31 Jan 2022 17:21:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 618DE222CA1;
 Mon, 31 Jan 2022 17:21:48 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan 2022 17:21:48
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 31 Jan 2022 17:21:40 +0100
Message-ID: <20220131172131.4.Ic863c28ffdcc15b3f4616434c2efd88b4e45495c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
References: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 4/4] cmd: clk: fix long help message
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

Fix the long help message for "clk setfreq" command

Fixes: 7ab418fbe612 ("clk: add support for setting clk rate from cmdline")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index 73dea5e746..a483fd8981 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -160,7 +160,7 @@ static int do_clk(struct cmd_tbl *cmdtp, int flag, int argc,
 #ifdef CONFIG_SYS_LONGHELP
 static char clk_help_text[] =
 	"dump - Print clock frequencies\n"
-	"setfreq [clk] [freq] - Set clock frequency";
+	"clk setfreq [clk] [freq] - Set clock frequency";
 #endif
 
 U_BOOT_CMD(clk, 4, 1, do_clk, "CLK sub-system", clk_help_text);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
