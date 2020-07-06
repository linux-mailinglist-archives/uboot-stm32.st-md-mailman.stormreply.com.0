Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E46215650
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 13:27:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7067CC36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 11:27:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ED47C36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 11:27:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066BPgJZ019786; Mon, 6 Jul 2020 13:26:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+pv5oKl/TyLdIlETvx8rPF+DxjDM7AnW0/dxyXctRPk=;
 b=si7S0vRbQuOuwswWMXc2USe76ah8LUrrxTNKJm+8UOXuPhozn11SXWSHpZsw5w2Hy3um
 2ZGujOOukLOl1hJw9pR+tKkp/UjmMqrnquCgpKKzClpuJ3pGvAujyf9xmEowLg39L1FJ
 iwalaWVUHNQd315TdYJR09VrT9fXJ0dLfiaD7EONTzdNkXrBKIsnQj2KMA3AZPNzBuTw
 VCxsrMItXFyyfN4RadJT1yLiCP9TG8Tz/9SIHMHJ82d+rS3HQLgETRtN9lEgNq8ydz4c
 ZlWCaKIXKHP5GdeRuG0JlUqT30u67EY0M13HPONxbCNjpchTRmn+yz8e1dwOao46W4e4 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfaqya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:26:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13288100034;
 Mon,  6 Jul 2020 13:26:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C22A2B4D28;
 Mon,  6 Jul 2020 13:26:56 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 6 Jul 2020 13:26:55 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jul 2020 13:26:52 +0200
Message-ID: <20200706112653.18951-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706112653.18951-1-patrick.delaunay@st.com>
References: <20200706112653.18951-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_08:2020-07-06,
 2020-07-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Heiko Schocher <hs@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/3] i2c: stm32f7: add stm32mp15 compatible
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

Add a new compatible "st,stm32mp15-i2c" introduced in Linux kernel v5.8

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/i2c/stm32f7_i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index ada8f4095e..593f713d6b 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -873,6 +873,7 @@ static const struct dm_i2c_ops stm32_i2c_ops = {
 
 static const struct udevice_id stm32_i2c_of_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_setup },
+	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32f7_setup },
 	{}
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
