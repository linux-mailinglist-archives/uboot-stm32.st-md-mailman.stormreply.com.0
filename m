Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1C5FEBB9
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 11:34:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43079C6411E;
	Fri, 14 Oct 2022 09:34:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4633C6411C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 09:34:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E6xeL5020407;
 Fri, 14 Oct 2022 11:34:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=IRzshZht3ECpyB4Gnua1H5tCOQ3zybFJT7Kd2eWZneo=;
 b=VczxbJCLlhUiuGb36YJ6hdUyoPGvdkJvyqMZqV/hn/95S+XIFCE+6nOwiZUz8TGv1Uuv
 POcYcBM5tkO5e4pr+I7vn8W/Ac1Qh+D+9tFgYubRuySJP1sPHRJu0yEpLi05hvH6oPL+
 3UiJG+t0AhmM/EXmKQkj97ApT+tngc6RazTEXE8X8iIpkWx7d/jHqTJa/5xihvG5N9Jq
 AB/AECRrINbgXDZV85it2Vn0Tzo9+D8UP8JW9YwZglbVBQ3+89ZyYvVn6VQY/XsSPzPp
 XJrTG3Kh5d9vsF+Sw1OcBOiSHger+i7AhiWlV0V0zJoveDN18LUPnrOJh4VmMhbCQ3Hv ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5v4n7mp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 11:34:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3951010002A;
 Fri, 14 Oct 2022 11:34:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 343D221A915;
 Fri, 14 Oct 2022 11:34:05 +0200 (CEST)
Received: from localhost (10.75.127.122) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 11:34:02 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Oct 2022 11:33:53 +0200
Message-ID: <20221014113342.1.I1a9c695a185950bbbc9436856aeac65ea5e7b1fc@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH] cmd: clk: probe the clock before dump them
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

The clock UCLASS need to be probed to allow availability of the
private data (struct clk *), get in show_clks() with dev_get_clk_ptr()
before use them.

Without this patch the clock dump can cause crash because all the
private data are not available before calling the API clk_get_rate().

It is the case for the SCMI clocks, priv->channel is needed for
scmi_clk_get_rate() and it is initialized only in scmi_clk_probe().
This issue causes a crash for "clk dump" command on STM32MP135F-DK board
for SCMI clock not yet probed.

Fixes: 1a725e229096 ("clk: fix clock tree dump to properly dump out every registered clock")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/clk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index a483fd898122..9c58247935a3 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -21,8 +21,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 	struct clk *clkp, *parent;
 	u32 rate;
 
-	clkp = dev_get_clk_ptr(dev);
-	if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
+	clkp = NULL;
+	if (device_get_uclass_id(dev) == UCLASS_CLK && !device_probe(dev)) {
+		clkp = dev_get_clk_ptr(dev);
+	}
+	if (clkp) {
 		parent = clk_get_parent(clkp);
 		if (!IS_ERR(parent) && depth == -1)
 			return;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
