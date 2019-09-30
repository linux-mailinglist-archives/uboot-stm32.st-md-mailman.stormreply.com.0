Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D004DC2235
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:38:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BACCC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:38:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F2EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:38:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDb9Ju018702; Mon, 30 Sep 2019 15:38:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WcbbWgbq5xbSuNw9G5AWGkXoza/RPyWn3vCZAUEyhGc=;
 b=muqzCCla7xmwRmA4iXN/TKd+DkVzNLkP/qHRpH7SY06EHx0mtwp14iIqJFUltK/0FbBY
 A37GHaJPS4YK1V8WnEec3yxkrrSnhMM8Qf8mqZfHBY5oKT6Lte7m0S5IacpkCf3/XDLN
 3xu/Ez6pnuO24wjm0WfB2bLsl7fxw89Krflj/1LwQIxtLesjXF2BKihjGsXI9GZMmQPf
 dpG+bwKcUCdfOovl9B8skzrfdaJuwLE1/QDErUnKLxELzaFHITh32BLYm1s8eQ5OOXEd
 0l3Wuca4vmfl0jNx+irGxubzS3amRUAXGHQwFVrc/Z94cp7fjaqiEJIoZFXTnHbVVpNm Tw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w00uf0u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:38:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E28024;
 Mon, 30 Sep 2019 13:38:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C84BA2FF5F8;
 Mon, 30 Sep 2019 15:38:34 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:34 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:34
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:16 +0200
Message-ID: <20190930133832.11992-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 "Andrew F. Davis" <afd@ti.com>
Subject: [Uboot-stm32] [PATCH v2 00/16] dfu: update dfu stack and add MTD
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


Changes in v2:
- Add dfu documentation
- Update dfu documentation for callbacks
- Add dfu documentation for several device
- Update commit message
- Update commit message
- Update dfu documentation for MTD
- Update dfu documentation for MTD
- Update dfu documentation for virtual backend
- Update dfu documentation for callbacks
- Update callbacks comment after Lukasz review
- Update after Lukasz Majewski comments

Patrick Delaunay (16):
  dfu: cosmetic: cleanup sf to avoid checkpatch error
  doc: dfu: Add dfu documentation
  dfu: sf: add partition support for nor backend
  dfu: prepare the support of multiple interface
  dfu: allow to manage DFU on several devices
  dfu: allow read with no data without error for EOF indication
  dfu: add backend for MTD device
  dfu: add partition support for MTD backend
  dfu: add DFU virtual backend
  dfu: add callback for flush and initiated operation
  stm32mp1: activate DFU support and command MTD
  stm32mp1: activate SET_DFU_ALT_INFO
  stm32mp1: configs: activate CONFIG_MTD_SPI_NAND
  stm32mp1: board: add spi nand support
  stm32mp1: add support for virtual partition read
  board: stm32mp1: fixup the usb product id for USB download gadget

 board/st/stm32mp1/README            | 111 ++++++++++
 board/st/stm32mp1/stm32mp1.c        | 181 +++++++++++++++-
 cmd/dfu.c                           |  21 +-
 configs/stm32mp15_basic_defconfig   |   6 +
 configs/stm32mp15_optee_defconfig   |   6 +
 configs/stm32mp15_trusted_defconfig |   6 +
 doc/README.dfu                      | 269 ++++++++++++++++++++++++
 drivers/dfu/Kconfig                 |  13 ++
 drivers/dfu/Makefile                |   2 +
 drivers/dfu/dfu.c                   | 145 +++++++++++--
 drivers/dfu/dfu_mtd.c               | 306 ++++++++++++++++++++++++++++
 drivers/dfu/dfu_sf.c                |  55 ++++-
 drivers/dfu/dfu_virt.c              |  49 +++++
 include/configs/stm32mp1.h          |  42 +++-
 include/dfu.h                       |  71 +++++++
 15 files changed, 1253 insertions(+), 30 deletions(-)
 create mode 100644 doc/README.dfu
 create mode 100644 drivers/dfu/dfu_mtd.c
 create mode 100644 drivers/dfu/dfu_virt.c

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
