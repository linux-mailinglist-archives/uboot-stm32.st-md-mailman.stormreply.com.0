Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B474C387A2D
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:41:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78F99C57B7D;
	Tue, 18 May 2021 13:41:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7938C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:41:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IDX08k023585; Tue, 18 May 2021 15:40:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=L2iAJuwFuN+51GlXgtz0S+Z6b4x/A0M0r5GGvItpfhM=;
 b=UOD9j7S+ZwPuQncRflYpPT23L/psEwNVfs1hR2A4Q1vKeQg03tmVmRlKFrwsRf1Gy9HN
 ir+qQviNoaeSSdVAj3infBtdVPBqvuXbe9mZMHvXpjSrFlTHoDtpsH/+bA6y+dBGUmdL
 MiVQ+EnGD842zIHiwXhK+zxiAIgv+AEUxVOBozdooUOfEcvHxru5oFwVc2Ykukvr8/fQ
 6/gSDyDyjRPzr0nF6SfN8046hf3I7rH5pgXi4GdSmHTK+blz7tvh0EW+lWIbROkAPKSe
 cLN73qzUSO6QhSEnQI2AQeONUntMcIQMrKyAePtxtcTKJRLB2kxoAFCwnQ5eq0RKJSVW ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunsgbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:40:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22C7510002A;
 Tue, 18 May 2021 15:40:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05C7D21D1BE;
 Tue, 18 May 2021 15:40:52 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:40:51
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:40:36 +0200
Message-ID: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: [Uboot-stm32] [PATCH 0/2] dm: core: Add address translation in
	fdt_get_resource - fixes
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


Hi,

This serie push again 2 modifications proposed in previous serie V3 [1]
but missing in master branch as only patchset V1 [2] is merged.

Simon, I don't add your Reviewed-by, even you sent it for [1].

The first patch solves a issue see by horatiu.vultur@microchip.com
in V1 [2].

Regards,
Patrick

[1] [v3] dm: core: Add address translation in fdt_get_resource
    http://patchwork.ozlabs.org/project/uboot/list/?series=242010&state=*

[2] dm: core: Add address translation in fdt_get_resource
    http://patchwork.ozlabs.org/project/uboot/list/?series=237557&state=*


Patrick Delaunay (2):
  net: luton: remove address translation after ofnode_read_resource
  test: add dm_test_read_resource

 drivers/net/mscc_eswitch/luton_switch.c |  5 +---
 test/dm/test-fdt.c                      | 33 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
