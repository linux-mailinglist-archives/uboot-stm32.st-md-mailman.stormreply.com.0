Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDC2630DF
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 17:48:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E5E4C3FAE2
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:48:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88BC4C3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 15:48:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089FgbK8006602; Wed, 9 Sep 2020 17:48:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WpyLSp+CSrMSyymWX2hToDmbiDI08vluVaHLR0ICbRg=;
 b=UKvBN1WCfug4UKawxV9zTgFud8AEMV2S3o9T22Z292qYjsUG36exBTDUZBk89J8VTbYi
 pVfZF6K32S36JErV4Piah/0x1+jfJUr2V45t62ensPnVh3bm0aoOYRa+kzyyBjU04tdb
 ysaDcGOIpVyl7UZQ+cJnjn1id+pO/NI1hdjEzTB5nQlQXUowtRFeIDivVSiT/chFTv7M
 bFbNOjHGJiTFmzbRqWuQkBwfV9i7/1mON0a4KU3rcPcfnvxm0Lzn7oh18+lUJJW+xw09
 UG2JGIDKXjV7ToFYomuOzFKRYwaogzptv40G/0TFA/LhUpJ1KXDcrRU5ciDYz10dNSPD 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0eux0k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 17:48:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE55510002A;
 Wed,  9 Sep 2020 17:48:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C46462BE232;
 Wed,  9 Sep 2020 17:48:17 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 17:48:17 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 17:48:15 +0200
Message-ID: <20200909154815.29020-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_09:2020-09-09,
 2020-09-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] mailbox: stm32_ipcc: Convert to use APIs
	which support live DT
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

Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
driver can support live DT.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/mailbox/stm32-ipcc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index b8bf356b4a..81a4115986 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -101,9 +101,8 @@ static int stm32_ipcc_probe(struct udevice *dev)
 {
 	struct stm32_ipcc *ipcc = dev_get_priv(dev);
 	fdt_addr_t addr;
-	const fdt32_t *cell;
 	struct clk clk;
-	int len, ret;
+	int ret;
 
 	debug("%s(dev=%p)\n", __func__, dev);
 
@@ -114,14 +113,12 @@ static int stm32_ipcc_probe(struct udevice *dev)
 	ipcc->reg_base = (void __iomem *)addr;
 
 	/* proc_id */
-	cell = dev_read_prop(dev, "st,proc_id", &len);
-	if (len < sizeof(fdt32_t)) {
+	ret = dev_read_u32_index(dev, "st,proc_id", 1, &ipcc->proc_id);
+	if (ret) {
 		dev_dbg(dev, "Missing st,proc_id\n");
 		return -EINVAL;
 	}
 
-	ipcc->proc_id = fdtdec_get_number(cell, 1);
-
 	if (ipcc->proc_id >= STM32_MAX_PROCS) {
 		dev_err(dev, "Invalid proc_id (%d)\n", ipcc->proc_id);
 		return -EINVAL;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
