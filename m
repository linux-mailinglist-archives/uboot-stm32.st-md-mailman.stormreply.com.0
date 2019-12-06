Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F021151C1
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 15:02:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53289C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 14:02:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A73CEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 14:02:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6DqxqB027919; Fri, 6 Dec 2019 15:01:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=EDvO2twd28sAoTrGZLOCoyMu8m5mX8gj8DF+DLRzPx4=;
 b=hrErPWYL+2q5L8rHuTW+xnIWwd6bGZijXcmUPzY5BHHem/qG82WbgYsVwZbs3Jxv3G9N
 adznonjXQgXByQqoWcubisgHtyZH7N/NLoYXlwbKXUg+blvdEzoEitL4xD1ynNxQDMzS
 88bvKQqYgru0yNpZgt4Cs+TzOrNZJR6oaXCER1BAiboSYbnbHvQbTf8Q/k9YmM253MHm
 uA9SQ+RKAFO9l/miK8syHQ0g9e7pXvK/MC/Si6PcIER6btY/VFJMfukp3k3EXgCuLW5D
 CuyorxKbDuv3bdB0+dcX2/2y4xYV39qYnoueshCz8aJJlyIy490tNIpBFGQN+c3zLJ4i HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkeeah0pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 15:01:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9E2010002A;
 Fri,  6 Dec 2019 15:01:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3CD42B3F1C;
 Fri,  6 Dec 2019 15:01:51 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Dec 2019 15:01:51 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Dec 2019 15:01:47 +0100
Message-ID: <20191206140149.7426-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_03:2019-12-05,2019-12-06 signatures=0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pankit Garg <pankit.garg@nxp.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>,
 Fabien Parent <fparent@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Udit Agarwal <udit.agarwal@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stefan Roese <sr@denx.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Mingming lee <mingming.lee@mediatek.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Mian Yousaf Kaukab <ykaukab@suse.de>,
 Chris Packham <judge.packham@gmail.com>, Vabhav Sharma <vabhav.sharma@nxp.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [RFT][PATCH v1 0/2] Fix CONFIG_SYS_UBOOT_START
	default value
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

This series fixes a regression introduced by
d3e97b53c1f2 ("spl: fix entry_point equal to load_addr")
which breaks some board boot (at least STM32MP15 in basic configuration)

If CONFIG_SYS_UBOOT_START is not set, it's set to CONFIG_SYS_TEXT_BASE
by default.
This allows also to clean include/configs board files in which
CONFIG_SYS_UBOOT_START is already set to CONFIG_SYS_TEXT_BASE.



Patrice Chotard (2):
  Makefile: Fix CONFIG_SYS_UBOOT_START default value
  treewide: Remove CONFIG_SYS_UBOOT_START from configs board files

 Makefile                                        | 2 +-
 include/configs/gardena-smart-gateway-at91sam.h | 1 -
 include/configs/ls1046a_common.h                | 1 -
 include/configs/mccmon6.h                       | 1 -
 include/configs/microblaze-generic.h            | 2 --
 include/configs/mt7623.h                        | 1 -
 include/configs/mt7629.h                        | 1 -
 include/configs/mt8518.h                        | 1 -
 include/configs/omap3_cairo.h                   | 1 -
 include/configs/pumpkin.h                       | 1 -
 include/configs/tegra-common.h                  | 1 -
 include/configs/x600.h                          | 1 -
 include/configs/xilinx_zynqmp_r5.h              | 2 --
 include/configs/zynq-common.h                   | 2 --
 14 files changed, 1 insertion(+), 17 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
