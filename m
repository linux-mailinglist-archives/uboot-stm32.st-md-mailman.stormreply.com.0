Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5DB21B5
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:19:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07E53C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:19:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C98C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGRwj026066; Fri, 13 Sep 2019 16:19:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lyfPzHCkr5YNPUVq8QGGbtiEZbBq3PTKpc5q//lZT/E=;
 b=tnmb4Tlc69hXg8ZQfOVm0C0qANVoJRU/8SXF3lA+dfO/q72cJ7lZASmJN0/2u2j+lCP3
 L8Lh5+G6/vtdu/URTM+9evTeUT9ctohpaj6aLWhX8VIXwBOX2YVrj7XDwvS/ePbHJWNu
 eGxYl9MppFkDLWT22nfi70juIDfo14g51zVXcBemIzj7b6yO0GsNgKB4+pk2kkJ/GYJB
 1oW7rRtcVpjFIv4cR1TEsOYmcxcGOBslCo3yFqgtCgXVeoOygaIkE8wYIPTJXx0E9NQl
 NUUFlpTKSkRHe5HhKs0wNaX+cJc1AGfT/CiTG8ASkHCQcpKW4uFajiancI4uRm6PsuhW +g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uytdxddb8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27EE94D;
 Fri, 13 Sep 2019 14:19:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C0142C7F40;
 Fri, 13 Sep 2019 16:19:18 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:18 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:17
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:01 +0200
Message-ID: <20190913141915.15546-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH 00/14] dfu: update dfu stack and add MTD
	backend
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


This serie based on v2019.10-rc3 propose updates on the DFU stack:
- add capability to have several DFU backend running in parallel
- add MTD backend for update of NAND, NOR or SPI-NAND
- add VIRTUAL backend for board/command specific behavior
- add some weak callback

It is the same content that the previous RFC:
http://patchwork.ozlabs.org/project/uboot/list/?series=120375
"dfu: update dfu stack and use them for stm32mp1"

To test the new features and as example, I update the stm32mp1 board
to use the new features; I test them with the command "dfu 0"
(for test I have dependency with patch
 http://patchwork.ozlabs.org/patch/1162076/)

The expected target of the dfu part for this serie is v2020.01.
I will merge the stm32mp1 part when they will be accepted by dfu
maintainers.

This serie prepares the DFU backend for the coming 'stm32prog' command
and for STM32CubeProgrammer on stm32mp1 platform.
This STMicroelectronics tool is based on DFU protocol and allows to
update all the boot devices and the OTPs on the ST boards
(so several DFU target in parallel, including spi nand).



Patrick Delaunay (14):
  dfu: cosmetic: cleanup sf to avoid checkpatch error
  dfu: sf: add partition support for nor backend
  dfu: prepare the support of multiple interface
  dfu: allow to manage DFU on several devices
  dfu: allow read with 0 data for EOF indication
  dfu: add backend for MTD device
  dfu: add partition support for MTD backend
  dfu: add DFU virtual backend
  dfu: add callback for flush and initiated operation
  stm32mp1: activate DFU support and command MTD
  stm32mp1: activate SET_DFU_ALT_INFO
  stp32mp1: configs: activate CONFIG_MTD_SPI_NAND
  stm32mp1: board: add spi nand support
  stm32mp1: add support for virtual partition read

 board/st/stm32mp1/README            | 111 ++++++++++
 board/st/stm32mp1/stm32mp1.c        | 164 ++++++++++++++-
 cmd/dfu.c                           |  21 +-
 configs/stm32mp15_basic_defconfig   |   6 +
 configs/stm32mp15_optee_defconfig   |   6 +
 configs/stm32mp15_trusted_defconfig |   6 +
 drivers/dfu/Kconfig                 |  13 ++
 drivers/dfu/Makefile                |   2 +
 drivers/dfu/dfu.c                   | 145 +++++++++++--
 drivers/dfu/dfu_mtd.c               | 306 ++++++++++++++++++++++++++++
 drivers/dfu/dfu_sf.c                |  55 ++++-
 drivers/dfu/dfu_virt.c              |  49 +++++
 include/configs/stm32mp1.h          |  42 +++-
 include/dfu.h                       |  51 +++++
 14 files changed, 947 insertions(+), 30 deletions(-)
 create mode 100644 drivers/dfu/dfu_mtd.c
 create mode 100644 drivers/dfu/dfu_virt.c

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
