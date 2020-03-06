Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8976017C542
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 19:18:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 550DAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 18:18:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B9E8C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 18:18:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026IEUlj028309; Fri, 6 Mar 2020 19:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xZdWNk5/uTa563npdRki8LYWJztbTqUkFCDxU8LL9i0=;
 b=tmJ7YJQ3Am872vap8tQhSC2NVjeVGV9CqsuAeK48jTvksh1nE1H/Q1jStHwmIB3wVFLp
 NF8OnaDVOqv9Ze8x4xWu9CZ/WqdHrp251TZNXFCX//8U9FppKn2Vp+pxZfbk9ljGJDa+
 nDBbq5qrWztvATYWFM1UFnHor/JAG9Be9NaicrBCfRqh3W4EqDCBxKpnndxVtpkIZbUt
 VJAXuTAOYtWqqyQlH6cMVD7OqH63F4WgZHh3xsVivJVpzW9junOm0DGfznoa9VCjEJH7
 Ha5nZnJPeWuLGX+T78qVMJx7OV8bkBBYTGVF+4HGt67MhZpdxKWZR72yyNqAILtPZ+C1 QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfea7h3n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 19:18:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8ED59100039;
 Fri,  6 Mar 2020 19:18:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 750122AA9F5;
 Fri,  6 Mar 2020 19:18:00 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 19:18:00 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 19:17:54 +0100
Message-ID: <20200306181758.12336-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_06:2020-03-06,
 2020-03-06 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Patrice
 Chotard <patrice.chotard@st.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH v3 0/4] Insure 16 alignment of reserved memory
	in board_f.c
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

It is a V3, rebased on master branch, for the serie
http://patchwork.ozlabs.org/project/uboot/list/?series=154685&state=*

Sorry for the delay between V2 and v3 (I lost this superseded serie).

After this first correction, only for bootstage alignment,
I remove the stm32mp1 workaround in the 2nd patch.

The 4th patch is a complete solution to alignment
(proposed in comment 5 of
 http://patchwork.ozlabs.org/patch/1201452/#2327366)
I always align the reserved memory to 16 bytes with a new function
reserve_stack_aligned().

But this patch causes an issue on ARM 32 bits, as the relocated gd
pointer is not initialized with gd->new_gd as expected now in
reserve_global_data() but is hard-coded with:
  relocated gd = gd->bd - GD_SIZE
  {with GD_SIZE = sizeof(struct global_data)}

After the 4rd patch, this assumption in not more true as
sizeof(struct global_data) is not always 16 bytes aligned.

This issue is solved with the 3rd patch of the serie
  arm: set the relocated gd with gd->new_gd

Only tested on STM32MP157C-EV1 board (ARM32 architecture).


Changes in v3:
- rename reserve_sp to reserve_stack_aligned

Changes in v2:
- import: [U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment

Patrice Chotard (1):
  board_f.c: Insure gd->new_bootstage alignment

Patrick Delaunay (3):
  Revert "stm32mp1: remove the imply BOOTSTAGE"
  arm: set the relocated gd with gd->new_gd
  board_f.c: Insure 16 alignment of start_addr_sp and reserved memory

 arch/arm/lib/crt0.S           |  3 +--
 arch/arm/mach-stm32mp/Kconfig |  2 ++
 common/board_f.c              | 27 ++++++++++++++++++---------
 3 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
