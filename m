Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044E14572C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 14:53:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A946C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 13:53:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A070AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 13:53:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MDm0fX014654; Wed, 22 Jan 2020 14:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=OLNAA1aLXz4RngHE5NYOV4F8kQqqRriFOjtbUFLL6nc=;
 b=T2p+wE/S5VNTL5vLXDTPDKme4G8HAehzalvXt3lg60EFGc9bK8c6mUaKTxzgtO/Hiaek
 PuEO0/N5aSTZ9kfC7hLu2gurxGHlC1XfdKoEhOe6TqVDQq1RT/XD6bUTd6SX+CNPYNP8
 UsaVz1DAc5E9P0N7QqfFWch0/x7BJupeYUitcV+vW+DNv47NFdzQ0Fe7MkVphvNzLGL0
 8A1pTR97oREF3/zkwz9PBZj3wQmpz4WFF8UUL5eO35cRwn19oXeHx/meFz+qDTCJDn/Z
 oy8byp8prN/jxw+QHhGdQqz/Am9KHqPYCcF24uqTAPwpn78nuzCK70lfFg2Cq3N7htpr DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrc54vbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 14:52:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D047B10002A;
 Wed, 22 Jan 2020 14:52:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9DA22C6A66;
 Wed, 22 Jan 2020 14:52:47 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Jan 2020 14:52:47 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Jan 2020 14:52:39 +0100
Message-ID: <20200122135243.17683-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Patrice
 Chotard <patrice.chotard@st.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, Vikas Manocha <vikas.manocha@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH v2 0/4] Insure 16 alignment of reserved memory
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

It is a V2, rebased on master branch, for the untitled serie
http://patchwork.ozlabs.org/project/uboot/list/?series=152226

This serie now include the previous patch:
[U-Boot,v3] board_f.c: Insure gd->new_bootstage alignment
http://patchwork.ozlabs.org/patch/1201452/

After this first correction, I remove the stm32mp1 workaround
as the issue of bootstage alignment is solved.

The 4th patch is a complete solution to alignment
(proposed in comment 5 of
 http://patchwork.ozlabs.org/patch/1201452/#2327366)
I always align the reserved memory to 16 bytes with a new function
reserve_sp().

This patch causes an issue on ARM 32 bits, as the relocated gd pointer
is not initialized with gd->new_gd as expected in reserve_global_data()
but is hard-coded with
  relocated gd = gd->bd - GD_SIZE
  {with GD_SIZE = sizeof(struct global_data)}

This issue is solved with the 3rd patch of the serie
  arm: set the relocated gd with gd->new_gd

Only tested on STM32MP157C-EV1 board (ARM32 architecture).


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
