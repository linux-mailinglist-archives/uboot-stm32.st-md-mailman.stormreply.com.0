Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D753CD08A
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jul 2021 11:22:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 548EFC597AB;
	Mon, 19 Jul 2021 09:22:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEEC5C57B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 09:22:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J9Cc0j005652; Mon, 19 Jul 2021 11:22:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=xA5/oy1czFAqv4Vi6yKPW7xU/NpahqNtTXawl2ZdocE=;
 b=W3zlodaZFsh8Q0Rq8IBlNaOqQoOkqm/zY2Z4C4M1HHJRWzvh5QOfD12+UjYoTjbz1YJm
 /fk1UUfewBvc0tkM5yqBT1b7vkFczYeOAck/bQ/eShzkxAMGNinj2T4FaVxNEPtpRTPd
 MZd15WvCO7xXKP5toBS7/rdlc4vasFU4x7kG1YiiowUp0atkDgDlGQ3KmETscOVgM3CT
 PWzk2WshaIc5fvCN7R1utiRt6tD5GE7xiXtDtsZELFyVUbCJ1UmuS+ZXy6KK3a58OzlW
 36YSj80HFFWsGWGi1LpUi8pVPNeqbaAh6cLKNY9kq6ThPmdyH2DzNRBim9IzWuGnyVCh hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w4kggum3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:22:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C66810002A;
 Mon, 19 Jul 2021 11:22:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 427A32194FC;
 Mon, 19 Jul 2021 11:22:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul 2021 11:22:03
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Jul 2021 11:21:49 +0200
Message-ID: <20210719092151.1346480-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Tom Rini <trini@konsulko.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Suneel Garapati <sgarapati@marvell.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Harald Seiler <hws@denx.de>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: [Uboot-stm32] [PATCH v2 0/2] arm64: Update memcpy_{from,
	to}io() helpers
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


V2 of previous serie [1] sent by Patrice.

The compilation issues raised by Tom are solved [2].

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=231203&state=*

[2] https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/8310


Changes in v2:
- NEW: solve conflicts when cpu_func.h is included

Patrice Chotard (1):
  arm64: Update memcpy_{from, to}io() helpers

Patrick Delaunay (1):
  arm: use the correct prototype for reset_cpu function

 arch/arm/cpu/armv8/cache_v8.c           | 10 ++++++++++
 arch/arm/include/asm/io.h               | 25 +++++++++++++++----------
 arch/arm/mach-mediatek/mt8183/init.c    |  2 +-
 board/congatec/cgtqmx8/cgtqmx8.c        |  2 +-
 board/hoperun/hihope-rzg2/hihope-rzg2.c |  2 +-
 board/silinux/ek874/ek874.c             |  2 +-
 include/cpu_func.h                      |  1 +
 7 files changed, 30 insertions(+), 14 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
