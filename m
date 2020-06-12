Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76B1F7558
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 10:35:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FBAFC36B22
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 08:35:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2479C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 08:35:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C8XUPV022126; Fri, 12 Jun 2020 10:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yiJfA5N/a474DcaEzwWPwTZbns8/85asEto3owOM6eA=;
 b=cWvCrbaTgo7Xq7OqPdFr2edxqX2T0NpU1Gn9+AJa13CjkcWwT2asbUauuPJ/aF8BXzSS
 zlGe75y8dnpno9vk1IgbM5W7ffNbrb9IAhWdv9LMcGIkcGu+y7SbnPb6YPHHJ4Opwe/a
 lnVMl2lthys7LMHWyoPpMt1XTaZVFvSz96aS6xsPg1Su+utKQPRD+5RgO8MW3EeQ/rAL
 wh7PCHcTCRFBFvE1R46gM5Fb+JoqS7PtfUuLK+hMew8lA3CwkZJknYudzKsVzuhNwTw7
 3HdFPeNImQK1bEEEuwsTF/x2BgK4/rL/nX/EiUG6el7uoKRh7E1RNsnb0a7Z/lTJHpv/ Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g097q8e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 10:35:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4355610002A;
 Fri, 12 Jun 2020 10:35:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3944B2B6681;
 Fri, 12 Jun 2020 10:35:05 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 12 Jun 2020 10:35:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 12 Jun 2020 10:34:56 +0200
Message-ID: <20200612083504.20746-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_07:2020-06-11,
 2020-06-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] ram: stm32mp1: use the DDR size by
	default in the test addressBus
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

The test 4 = "AddressBus [size] [addr]" without parameter
detects alias for any address bit only when:
- size = real size of DDR
- addr = start of DDR = 0xC0000000

These value must by the default value when parameters are absent.

This patch sets bufsize to STM32_DDR_SIZE and get_bufsize() selects
the correct value for bufsize when this parameter is absent =
full size of the DDDR

On EV1 board :
DDR> test 4
running at 0xC0000000 length 0x40000000

On DK2 board
DDR> test 4
running at 0xC0000000 length 0x20000000

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/ram/stm32mp1/stm32mp1_tests.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index fec9fd010e..a2a69da9a3 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -442,7 +442,7 @@ static enum test_result test_addressbus(struct stm32mp1_ddrctl *ctl,
 	u32 bufsize;
 	u32 error;
 
-	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
+	if (get_bufsize(string, argc, argv, 0, &bufsize, STM32_DDR_SIZE, 4))
 		return TEST_ERROR;
 	if (!is_power_of_2(bufsize)) {
 		sprintf(string, "size 0x%x is not a power of 2",
@@ -452,6 +452,7 @@ static enum test_result test_addressbus(struct stm32mp1_ddrctl *ctl,
 	if (get_addr(string, argc, argv, 1, &addr))
 		return TEST_ERROR;
 
+	printf("running at 0x%08x length 0x%x\n", addr, bufsize);
 	error = (u32)addressbus((u32 *)addr, bufsize);
 	if (error) {
 		sprintf(string, "0x%x: error for address 0x%x",
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
