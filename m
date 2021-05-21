Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F738C494
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 May 2021 12:25:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 315EBC57B69;
	Fri, 21 May 2021 10:25:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 751DAC57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 10:25:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LAMA5k029799; Fri, 21 May 2021 12:25:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=GaDFTkpcCwNvNyz/y8Wd2pXZgvJ1RfJM1q9dpHr9CwY=;
 b=Par5VtGlyB0KoUOqWAicwnvBAhtnjaR0x6D/dhuYCPfg+iYIich1zATIWJKKkMh8lTAx
 D4kj8nIx3zqbiJ2iz+JtvKOLziSedicNmE5+3xUBMCkyo39AhnXBViA8LSan3/PnaQh3
 sw7CGaFMsYuOCkOFaQESJe1aFQCVR0Dez8ciR5BnqBFlsdNs81bufn+Q2dQ/mC1mmYJq
 o1lccXkAfCWaJ872gTT86XYZTQ4O/9CKKOYp7TAIdYc0cXSnRB20qK0sZaqdnEsgDOVE
 vHTyZX6YQbvhLvTVIMqIQU8hjOrbz9IsnWXTAWHzHoBKmMJKqIKx0SCtH3XuubcWa2e/ DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38p8pbrx5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:25:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A724410002A;
 Fri, 21 May 2021 12:25:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9078D21B534;
 Fri, 21 May 2021 12:25:06 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May 2021 12:25:06
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 May 2021 12:24:58 +0200
Message-ID: <20210521102500.12981-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: [Uboot-stm32] [PATCH v2 0/2] dm: core: Add address translation in
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

The first patch solves a issue see by horatiu.vultur@microchip.com
in V1 [2].

Regards,
Patrick

[1] [v3] dm: core: Add address translation in fdt_get_resource
    http://patchwork.ozlabs.org/project/uboot/list/?series=242010&state=*

[2] dm: core: Add address translation in fdt_get_resource
    http://patchwork.ozlabs.org/project/uboot/list/?series=237557&state=*

Changes in v2:
- Add reviewed-by
- Add reviewed-by
- use lower-case hex

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
