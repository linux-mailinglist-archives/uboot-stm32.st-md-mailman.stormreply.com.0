Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6F135EF5
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 18:11:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD9BAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 17:11:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA619C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 17:11:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009H3p3s002265; Thu, 9 Jan 2020 18:11:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jaBkQ2g78mKDUmYlbeZBpmXy78yRWwdQKf9UYxHjddQ=;
 b=FUk3GUhJv9ZoBTKw5AXsKuamsJTj6AdREmu9KO0EsDXx/loS2is4ondcmrDxgbSSORc0
 wEo+WrBr5PHIfWkfHOU5PAO+BTfK12gfqf4IeaU9dKg8ysLsoajPuVx2kYh5ijV10Tea
 Ns2701+klY0OOfSzyvTBcmHxgtXRMu/Zvq3J4K33Yo6N5gVn9cvuojcf6NC6/SQP9duy
 HSzTJpCmgLTjYVczkVYhVb4hX12G8sKJCceI0f7zRIXgAzuVNlJ3TyfqhfYBg3d8+0Dn
 Sa3TZRpDk3k1oeZJKXfWsgS+AC3fN8msZ5KhV+ZL8kml2bIvMTuv1aqZl3TvHy1mFZKa Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur2vdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 18:11:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61E8B100034;
 Thu,  9 Jan 2020 18:11:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F22820F726;
 Thu,  9 Jan 2020 18:11:32 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 9 Jan 2020 18:11:32 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Jan 2020 18:11:20 +0100
Message-ID: <20200109171123.16348-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Patrice
 Chotard <patrice.chotard@st.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich
 Schuchardt <xypron.glpk@gmx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Vikas Manocha <vikas.manocha@st.com>, Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH 0/3]
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

This serie depends on
http://patchwork.ozlabs.org/patch/1201452/
[U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment reserve_sp

It should be applied only after this patch.

First I remove the stm32mp1 workaround as the issue of bootstage
alignment is solved.

The 3rd patch is a complete solution (proposed in comment 5
of previous patch http://patchwork.ozlabs.org/patch/1201452/#2327366)
  always align the reserved memory to 16 bytes with a new function
  reserve_sp()

This patch causes an issue on ARM 32 bits, as relocated gd pointer
is not initialized with gd->new_gd as expected in reserve_global_data()
but is hardcoded with
relocated gd = gd->bd - GD_SIZE {GD_SIZE = sizeof(struct global_data)}

This issue is solved with the second patch of the serie
  arm: set the relocated gd with gd->new_gd

Only tested on STM32MP157C-EV1 board.



Patrick Delaunay (3):
  Revert "stm32mp1: remove the imply BOOTSTAGE"
  arm: set the relocated gd with gd->new_gd
  board_f.c: Insure 16 alignment of start_addr_sp and reserved memory

 arch/arm/lib/crt0.S           |  3 +--
 arch/arm/mach-stm32mp/Kconfig |  2 ++
 common/board_f.c              | 32 ++++++++++++++++++--------------
 3 files changed, 21 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
